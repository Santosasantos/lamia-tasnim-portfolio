-- ============================================
-- COMPLETE HERO & MEDIA COVERAGE DEPLOYMENT
-- ============================================
-- This script sets up everything needed for the dynamic hero and media coverage sections

-- Step 1: Add hero customization fields to profiles table
ALTER TABLE profiles 
ADD COLUMN IF NOT EXISTS hero_badge_text TEXT DEFAULT 'Key Representative · Bangladesh',
ADD COLUMN IF NOT EXISTS hero_subtitle TEXT DEFAULT 'Representing Bangladesh in Global Mental Health & Public Health',
ADD COLUMN IF NOT EXISTS show_credentials BOOLEAN DEFAULT true,
ADD COLUMN IF NOT EXISTS credential_1_icon TEXT DEFAULT 'Award',
ADD COLUMN IF NOT EXISTS credential_1_text TEXT DEFAULT 'Global Youth Leadership Award',
ADD COLUMN IF NOT EXISTS credential_2_icon TEXT DEFAULT 'School',
ADD COLUMN IF NOT EXISTS credential_2_text TEXT DEFAULT 'MPH, North South University';

-- Step 2: Update profile bio to be shorter and more impactful
UPDATE profiles 
SET 
  bio = 'Bridging research, AI in healthcare, and community mental health programs. Over a decade of experience strengthening systems and representing Bangladesh in global health discussions with ethical leadership.',
  hero_badge_text = 'Key Representative · Bangladesh',
  hero_subtitle = 'Representing Bangladesh in Global Mental Health & Public Health',
  show_credentials = true,
  credential_1_icon = 'Award',
  credential_1_text = 'Global Youth Leadership Award',
  credential_2_icon = 'School',
  credential_2_text = 'MPH, North South University'
WHERE full_name = 'Lamia Tasnim';

-- Step 3: Create media_coverage table
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

-- Step 4: Enable Row Level Security on media_coverage
ALTER TABLE media_coverage ENABLE ROW LEVEL SECURITY;

-- Step 5: Drop existing policies if they exist
DROP POLICY IF EXISTS "Allow public read access to media_coverage" ON media_coverage;
DROP POLICY IF EXISTS "Allow authenticated users full access to media_coverage" ON media_coverage;

-- Step 6: Create RLS policies for media_coverage
CREATE POLICY "Allow public read access to media_coverage"
  ON media_coverage FOR SELECT
  USING (true);

CREATE POLICY "Allow authenticated users full access to media_coverage"
  ON media_coverage FOR ALL
  USING (auth.uid() IS NOT NULL);

-- Step 7: Seed media coverage data
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
)
ON CONFLICT DO NOTHING;

-- Step 8: Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_media_coverage_display_order ON media_coverage(display_order);
CREATE INDEX IF NOT EXISTS idx_media_coverage_featured ON media_coverage(is_featured);

-- Step 9: Verify the setup
SELECT 
  'Profile Updated' as status,
  full_name,
  hero_badge_text,
  credential_1_text,
  credential_2_text,
  LENGTH(bio) as bio_length
FROM profiles 
WHERE full_name = 'Lamia Tasnim';

SELECT 
  'Media Coverage Created' as status,
  COUNT(*) as total_outlets,
  COUNT(*) FILTER (WHERE is_featured = true) as featured_outlets
FROM media_coverage;

-- Success message
DO $$
BEGIN
  RAISE NOTICE '✅ Hero & Media Coverage deployment completed successfully!';
  RAISE NOTICE '📝 Profile bio updated to shorter version';
  RAISE NOTICE '🏆 Hero credentials configured';
  RAISE NOTICE '📰 Media coverage table created with % entries', (SELECT COUNT(*) FROM media_coverage);
  RAISE NOTICE '🎯 Next steps:';
  RAISE NOTICE '   1. Visit /admin/profile to customize hero section';
  RAISE NOTICE '   2. Visit /admin/media-coverage to manage media outlets';
  RAISE NOTICE '   3. Check homepage to see the changes';
END $$;
