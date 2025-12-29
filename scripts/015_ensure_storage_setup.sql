-- Master script to ensure all storage buckets and columns exist
-- This script is idempotent and can be run multiple times safely

-- ============================================
-- STEP 1: Add all necessary columns to tables
-- ============================================

-- Publications table columns
ALTER TABLE publications 
ADD COLUMN IF NOT EXISTS academic_pdf TEXT,
ADD COLUMN IF NOT EXISTS citation_count INTEGER DEFAULT 0,
ADD COLUMN IF NOT EXISTS conference_title TEXT,
ADD COLUMN IF NOT EXISTS conference_organizer TEXT,
ADD COLUMN IF NOT EXISTS location TEXT,
ADD COLUMN IF NOT EXISTS conference_images TEXT[],
ADD COLUMN IF NOT EXISTS conference_paper_pdf TEXT,
ADD COLUMN IF NOT EXISTS conference_videos TEXT[];

-- Awards table columns
ALTER TABLE awards 
ADD COLUMN IF NOT EXISTS image TEXT;

-- Profiles table columns (if not already present)
ALTER TABLE profiles 
ADD COLUMN IF NOT EXISTS github_url TEXT;

-- ============================================
-- STEP 2: Create all storage buckets
-- ============================================

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
-- STEP 3: Set up storage policies for Academic PDFs
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
-- STEP 4: Set up storage policies for Award Images
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
-- STEP 5: Set up storage policies for Conference Images
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
-- STEP 6: Set up storage policies for Conference PDFs
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
-- STEP 7: Set up storage policies for Conference Videos
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
-- STEP 8: Create indexes for better performance
-- ============================================

CREATE INDEX IF NOT EXISTS idx_publications_category ON publications(category);
CREATE INDEX IF NOT EXISTS idx_publications_status ON publications(status);
CREATE INDEX IF NOT EXISTS idx_experiences_category ON experiences(category);
CREATE INDEX IF NOT EXISTS idx_skills_category ON skills(category);

