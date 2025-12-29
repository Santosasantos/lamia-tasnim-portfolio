-- ============================================
-- COMPLETE SETUP FOR NEW SUPABASE PROJECT
-- Run this script in a fresh Supabase database
-- ============================================

-- ============================================
-- STEP 1: Enable Extensions
-- ============================================
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ============================================
-- STEP 2: Create Admin Users Table
-- ============================================
CREATE TABLE IF NOT EXISTS admin_users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email TEXT UNIQUE NOT NULL,
  full_name TEXT NOT NULL,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

ALTER TABLE admin_users ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Admins can read their own data"
  ON admin_users FOR SELECT
  USING (auth.uid()::text = id::text);

CREATE POLICY "Authenticated users can read admin_users"
  ON admin_users FOR SELECT
  USING (auth.uid() IS NOT NULL);

-- ============================================
-- STEP 3: Create All Portfolio Tables
-- ============================================

-- Profile table (single row for the portfolio owner)
CREATE TABLE IF NOT EXISTS profiles (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  full_name TEXT NOT NULL,
  title TEXT NOT NULL,
  bio TEXT NOT NULL,
  email TEXT NOT NULL,
  phone TEXT,
  address TEXT,
  profile_image TEXT,
  linkedin_url TEXT,
  facebook_url TEXT,
  github_url TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Education table
CREATE TABLE IF NOT EXISTS education (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  institution TEXT NOT NULL,
  degree TEXT NOT NULL,
  field_of_study TEXT,
  start_date TEXT NOT NULL,
  end_date TEXT,
  cgpa TEXT,
  location TEXT,
  achievements TEXT,
  status TEXT DEFAULT 'Completed',
  display_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Professional Experience table
CREATE TABLE IF NOT EXISTS experiences (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  position TEXT NOT NULL,
  organization TEXT NOT NULL,
  project_name TEXT,
  start_date TEXT NOT NULL,
  end_date TEXT,
  location TEXT,
  employment_type TEXT DEFAULT 'Full Time',
  description TEXT,
  responsibilities TEXT[],
  category TEXT DEFAULT 'Research',
  display_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Publications table (with all extended columns)
CREATE TABLE IF NOT EXISTS publications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  authors TEXT NOT NULL,
  journal TEXT,
  publication_date TEXT,
  status TEXT DEFAULT 'Published',
  category TEXT DEFAULT 'Academic Publication',
  citations INTEGER DEFAULT 0,
  citation_count INTEGER DEFAULT 0,
  keywords TEXT[],
  abstract TEXT,
  url TEXT,
  academic_pdf TEXT,
  conference_title TEXT,
  conference_organizer TEXT,
  location TEXT,
  conference_images TEXT[],
  conference_paper_pdf TEXT,
  conference_videos TEXT[],
  display_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Skills table
CREATE TABLE IF NOT EXISTS skills (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  proficiency TEXT DEFAULT 'Advanced',
  icon TEXT,
  display_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Awards and Honors table (with image column)
CREATE TABLE IF NOT EXISTS awards (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  issuer TEXT NOT NULL,
  date TEXT NOT NULL,
  description TEXT,
  certificate_url TEXT,
  image TEXT,
  display_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Volunteering table
CREATE TABLE IF NOT EXISTS volunteering (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  role TEXT NOT NULL,
  organization TEXT NOT NULL,
  start_date TEXT NOT NULL,
  end_date TEXT,
  description TEXT,
  display_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Scholarly Activities table
CREATE TABLE IF NOT EXISTS scholarly_activities (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  type TEXT NOT NULL,
  organization TEXT,
  date TEXT NOT NULL,
  description TEXT,
  display_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Blogs table
CREATE TABLE IF NOT EXISTS blogs (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  excerpt TEXT,
  content TEXT NOT NULL,
  published_date TEXT NOT NULL,
  featured_image TEXT,
  tags TEXT[],
  is_published BOOLEAN DEFAULT true,
  display_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Certifications table
CREATE TABLE IF NOT EXISTS certifications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  issuer TEXT NOT NULL,
  issue_date TEXT NOT NULL,
  credential_url TEXT,
  display_order INTEGER DEFAULT 0,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ============================================
-- STEP 4: Enable Row Level Security (RLS)
-- ============================================
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE education ENABLE ROW LEVEL SECURITY;
ALTER TABLE experiences ENABLE ROW LEVEL SECURITY;
ALTER TABLE publications ENABLE ROW LEVEL SECURITY;
ALTER TABLE skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE awards ENABLE ROW LEVEL SECURITY;
ALTER TABLE volunteering ENABLE ROW LEVEL SECURITY;
ALTER TABLE scholarly_activities ENABLE ROW LEVEL SECURITY;
ALTER TABLE blogs ENABLE ROW LEVEL SECURITY;
ALTER TABLE certifications ENABLE ROW LEVEL SECURITY;

-- ============================================
-- STEP 5: Create RLS Policies - Public Read Access
-- ============================================
CREATE POLICY "Allow public read access to profiles"
  ON profiles FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access to education"
  ON education FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access to experiences"
  ON experiences FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access to publications"
  ON publications FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access to skills"
  ON skills FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access to awards"
  ON awards FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access to volunteering"
  ON volunteering FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access to scholarly_activities"
  ON scholarly_activities FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access to blogs"
  ON blogs FOR SELECT
  USING (true);

CREATE POLICY "Allow public read access to certifications"
  ON certifications FOR SELECT
  USING (true);

-- ============================================
-- STEP 6: Create RLS Policies - Authenticated Full Access
-- ============================================
CREATE POLICY "Allow authenticated users full access to profiles"
  ON profiles FOR ALL
  USING (auth.uid() IS NOT NULL);

CREATE POLICY "Allow authenticated users full access to education"
  ON education FOR ALL
  USING (auth.uid() IS NOT NULL);

CREATE POLICY "Allow authenticated users full access to experiences"
  ON experiences FOR ALL
  USING (auth.uid() IS NOT NULL);

CREATE POLICY "Allow authenticated users full access to publications"
  ON publications FOR ALL
  USING (auth.uid() IS NOT NULL);

CREATE POLICY "Allow authenticated users full access to skills"
  ON skills FOR ALL
  USING (auth.uid() IS NOT NULL);

CREATE POLICY "Allow authenticated users full access to awards"
  ON awards FOR ALL
  USING (auth.uid() IS NOT NULL);

CREATE POLICY "Allow authenticated users full access to volunteering"
  ON volunteering FOR ALL
  USING (auth.uid() IS NOT NULL);

CREATE POLICY "Allow authenticated users full access to scholarly_activities"
  ON scholarly_activities FOR ALL
  USING (auth.uid() IS NOT NULL);

CREATE POLICY "Allow authenticated users full access to blogs"
  ON blogs FOR ALL
  USING (auth.uid() IS NOT NULL);

CREATE POLICY "Allow authenticated users full access to certifications"
  ON certifications FOR ALL
  USING (auth.uid() IS NOT NULL);

-- ============================================
-- STEP 7: Create Storage Buckets
-- ============================================

-- Profile Images bucket
INSERT INTO storage.buckets (id, name, public)
VALUES ('profile-images', 'profile-images', true)
ON CONFLICT (id) DO NOTHING;

-- Academic PDFs bucket
INSERT INTO storage.buckets (id, name, public)
VALUES ('academic-pdfs', 'academic-pdfs', true)
ON CONFLICT (id) DO NOTHING;

-- Award Images bucket
INSERT INTO storage.buckets (id, name, public)
VALUES ('award-images', 'award-images', true)
ON CONFLICT (id) DO NOTHING;

-- Conference Images bucket
INSERT INTO storage.buckets (id, name, public)
VALUES ('conference-images', 'conference-images', true)
ON CONFLICT (id) DO NOTHING;

-- Conference PDFs bucket
INSERT INTO storage.buckets (id, name, public)
VALUES ('conference-pdfs', 'conference-pdfs', true)
ON CONFLICT (id) DO NOTHING;

-- Conference Videos bucket
INSERT INTO storage.buckets (id, name, public)
VALUES ('conference-videos', 'conference-videos', true)
ON CONFLICT (id) DO NOTHING;

-- ============================================
-- STEP 8: Create Storage Policies - Profile Images
-- ============================================
DROP POLICY IF EXISTS "Public Access to Profile Images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can upload profile images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can update profile images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can delete profile images" ON storage.objects;

CREATE POLICY "Public Access to Profile Images"
ON storage.objects FOR SELECT
USING (bucket_id = 'profile-images');

CREATE POLICY "Authenticated users can upload profile images"
ON storage.objects FOR INSERT
WITH CHECK (bucket_id = 'profile-images' AND auth.uid() IS NOT NULL);

CREATE POLICY "Authenticated users can update profile images"
ON storage.objects FOR UPDATE
USING (bucket_id = 'profile-images' AND auth.uid() IS NOT NULL);

CREATE POLICY "Authenticated users can delete profile images"
ON storage.objects FOR DELETE
USING (bucket_id = 'profile-images' AND auth.uid() IS NOT NULL);

-- ============================================
-- STEP 9: Create Storage Policies - Academic PDFs
-- ============================================
DROP POLICY IF EXISTS "Public Access to Academic PDFs" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can upload academic PDFs" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can update academic PDFs" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can delete academic PDFs" ON storage.objects;

CREATE POLICY "Public Access to Academic PDFs"
ON storage.objects FOR SELECT
USING (bucket_id = 'academic-pdfs');

CREATE POLICY "Authenticated users can upload academic PDFs"
ON storage.objects FOR INSERT
WITH CHECK (bucket_id = 'academic-pdfs' AND auth.uid() IS NOT NULL);

CREATE POLICY "Authenticated users can update academic PDFs"
ON storage.objects FOR UPDATE
USING (bucket_id = 'academic-pdfs' AND auth.uid() IS NOT NULL);

CREATE POLICY "Authenticated users can delete academic PDFs"
ON storage.objects FOR DELETE
USING (bucket_id = 'academic-pdfs' AND auth.uid() IS NOT NULL);

-- ============================================
-- STEP 10: Create Storage Policies - Award Images
-- ============================================
DROP POLICY IF EXISTS "Public Access to Award Images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can upload award images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can update award images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can delete award images" ON storage.objects;

CREATE POLICY "Public Access to Award Images"
ON storage.objects FOR SELECT
USING (bucket_id = 'award-images');

CREATE POLICY "Authenticated users can upload award images"
ON storage.objects FOR INSERT
WITH CHECK (bucket_id = 'award-images' AND auth.uid() IS NOT NULL);

CREATE POLICY "Authenticated users can update award images"
ON storage.objects FOR UPDATE
USING (bucket_id = 'award-images' AND auth.uid() IS NOT NULL);

CREATE POLICY "Authenticated users can delete award images"
ON storage.objects FOR DELETE
USING (bucket_id = 'award-images' AND auth.uid() IS NOT NULL);

-- ============================================
-- STEP 11: Create Storage Policies - Conference Images
-- ============================================
DROP POLICY IF EXISTS "Public Access to Conference Images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can upload conference images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can update conference images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can delete conference images" ON storage.objects;

CREATE POLICY "Public Access to Conference Images"
ON storage.objects FOR SELECT
USING (bucket_id = 'conference-images');

CREATE POLICY "Authenticated users can upload conference images"
ON storage.objects FOR INSERT
WITH CHECK (bucket_id = 'conference-images' AND auth.uid() IS NOT NULL);

CREATE POLICY "Authenticated users can update conference images"
ON storage.objects FOR UPDATE
USING (bucket_id = 'conference-images' AND auth.uid() IS NOT NULL);

CREATE POLICY "Authenticated users can delete conference images"
ON storage.objects FOR DELETE
USING (bucket_id = 'conference-images' AND auth.uid() IS NOT NULL);

-- ============================================
-- STEP 12: Create Storage Policies - Conference PDFs
-- ============================================
DROP POLICY IF EXISTS "Public Access to Conference PDFs" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can upload conference PDFs" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can update conference PDFs" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can delete conference PDFs" ON storage.objects;

CREATE POLICY "Public Access to Conference PDFs"
ON storage.objects FOR SELECT
USING (bucket_id = 'conference-pdfs');

CREATE POLICY "Authenticated users can upload conference PDFs"
ON storage.objects FOR INSERT
WITH CHECK (bucket_id = 'conference-pdfs' AND auth.uid() IS NOT NULL);

CREATE POLICY "Authenticated users can update conference PDFs"
ON storage.objects FOR UPDATE
USING (bucket_id = 'conference-pdfs' AND auth.uid() IS NOT NULL);

CREATE POLICY "Authenticated users can delete conference PDFs"
ON storage.objects FOR DELETE
USING (bucket_id = 'conference-pdfs' AND auth.uid() IS NOT NULL);

-- ============================================
-- STEP 13: Create Storage Policies - Conference Videos
-- ============================================
DROP POLICY IF EXISTS "Public Access to Conference Videos" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can upload conference videos" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can update conference videos" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can delete conference videos" ON storage.objects;

CREATE POLICY "Public Access to Conference Videos"
ON storage.objects FOR SELECT
USING (bucket_id = 'conference-videos');

CREATE POLICY "Authenticated users can upload conference videos"
ON storage.objects FOR INSERT
WITH CHECK (bucket_id = 'conference-videos' AND auth.uid() IS NOT NULL);

CREATE POLICY "Authenticated users can update conference videos"
ON storage.objects FOR UPDATE
USING (bucket_id = 'conference-videos' AND auth.uid() IS NOT NULL);

CREATE POLICY "Authenticated users can delete conference videos"
ON storage.objects FOR DELETE
USING (bucket_id = 'conference-videos' AND auth.uid() IS NOT NULL);

-- ============================================
-- STEP 14: Create Performance Indexes
-- ============================================
CREATE INDEX IF NOT EXISTS idx_publications_category ON publications(category);
CREATE INDEX IF NOT EXISTS idx_publications_status ON publications(status);
CREATE INDEX IF NOT EXISTS idx_experiences_category ON experiences(category);
CREATE INDEX IF NOT EXISTS idx_skills_category ON skills(category);

-- ============================================
-- SETUP COMPLETE!
-- Next: Run the seed data script
-- ============================================

