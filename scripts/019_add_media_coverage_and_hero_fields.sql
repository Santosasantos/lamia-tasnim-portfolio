-- Add hero section customization fields to profiles table
ALTER TABLE profiles 
ADD COLUMN IF NOT EXISTS hero_badge_text TEXT DEFAULT 'Key Representative · Bangladesh',
ADD COLUMN IF NOT EXISTS hero_subtitle TEXT DEFAULT 'Representing Bangladesh in Global Mental Health & Public Health',
ADD COLUMN IF NOT EXISTS show_credentials BOOLEAN DEFAULT true,
ADD COLUMN IF NOT EXISTS credential_1_icon TEXT DEFAULT 'Award',
ADD COLUMN IF NOT EXISTS credential_1_text TEXT DEFAULT 'Global Youth Leadership Award',
ADD COLUMN IF NOT EXISTS credential_2_icon TEXT DEFAULT 'School',
ADD COLUMN IF NOT EXISTS credential_2_text TEXT DEFAULT 'MPH, North South University';

-- Create media_coverage table for managing media outlets
CREATE TABLE IF NOT EXISTS media_coverage (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  outlet_name TEXT NOT NULL,
  outlet_icon TEXT DEFAULT '📰',
  article_title TEXT,
  article_url TEXT,
  publication_date TEXT,
  description TEXT,
  display_order INTEGER DEFAULT 0,
  is_featured BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE media_coverage ENABLE ROW LEVEL SECURITY;

-- RLS Policies: Allow public read access
CREATE POLICY "Allow public read access to media_coverage"
  ON media_coverage FOR SELECT
  USING (true);

-- RLS Policies: Allow authenticated users full access
CREATE POLICY "Allow authenticated users full access to media_coverage"
  ON media_coverage FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Seed media coverage data for Lamia Tasnim
INSERT INTO media_coverage (outlet_name, outlet_icon, description, display_order, is_featured)
VALUES
(
  'The Bangladesh Today',
  '📰',
  'Featured coverage of youth-led mental health reform initiatives',
  1,
  true
),
(
  'Daily Janakantha',
  '📰',
  'Profile on community health systems and humanitarian engagement',
  2,
  true
),
(
  'RisingBD',
  '📰',
  'Coverage of mental health advocacy and program development',
  3,
  true
),
(
  'Lalmonirhat Barta',
  '📰',
  'Local coverage of community-based mental health initiatives',
  4,
  true
);

-- Update the existing profile with hero customization
UPDATE profiles 
SET 
  hero_badge_text = 'Key Representative · Bangladesh',
  hero_subtitle = 'Representing Bangladesh in Global Mental Health & Public Health',
  show_credentials = true,
  credential_1_icon = 'Award',
  credential_1_text = 'Global Youth Leadership Award',
  credential_2_icon = 'School',
  credential_2_text = 'MPH, North South University'
WHERE full_name = 'Lamia Tasnim';

-- Create index for better query performance
CREATE INDEX IF NOT EXISTS idx_media_coverage_display_order ON media_coverage(display_order);
CREATE INDEX IF NOT EXISTS idx_media_coverage_featured ON media_coverage(is_featured);
