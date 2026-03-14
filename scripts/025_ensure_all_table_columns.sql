-- ============================================================
-- Ensure ALL table columns exist (safe to run multiple times)
-- Covers every field written by admin form components
-- ============================================================

-- ============================================================
-- profiles — hero customization fields (added in script 019/021)
-- ============================================================
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS hero_badge_text TEXT DEFAULT 'Key Representative · Bangladesh';
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS hero_subtitle TEXT DEFAULT 'Representing Bangladesh in Global Mental Health & Public Health';
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS show_credentials BOOLEAN DEFAULT true;
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS credential_1_icon TEXT DEFAULT 'Award';
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS credential_1_text TEXT DEFAULT 'Global Youth Leadership Award';
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS credential_2_icon TEXT DEFAULT 'School';
ALTER TABLE profiles ADD COLUMN IF NOT EXISTS credential_2_text TEXT DEFAULT 'MPH, North South University';

-- ============================================================
-- certifications — image column (added in script 024)
-- ============================================================
ALTER TABLE certifications ADD COLUMN IF NOT EXISTS image TEXT;

-- ============================================================
-- awards — image and certificate_url (in base schema, but ensure)
-- ============================================================
ALTER TABLE awards ADD COLUMN IF NOT EXISTS image TEXT;
ALTER TABLE awards ADD COLUMN IF NOT EXISTS certificate_url TEXT;

-- ============================================================
-- skills — proficiency and icon (in base schema, but ensure)
-- ============================================================
ALTER TABLE skills ADD COLUMN IF NOT EXISTS proficiency TEXT DEFAULT 'Advanced';
ALTER TABLE skills ADD COLUMN IF NOT EXISTS icon TEXT;

-- ============================================================
-- education — all form fields (in base schema, but ensure)
-- ============================================================
ALTER TABLE education ADD COLUMN IF NOT EXISTS field_of_study TEXT;
ALTER TABLE education ADD COLUMN IF NOT EXISTS cgpa TEXT;
ALTER TABLE education ADD COLUMN IF NOT EXISTS location TEXT;
ALTER TABLE education ADD COLUMN IF NOT EXISTS achievements TEXT;
ALTER TABLE education ADD COLUMN IF NOT EXISTS status TEXT DEFAULT 'Completed';

-- ============================================================
-- experiences — all form fields (in base schema, but ensure)
-- ============================================================
ALTER TABLE experiences ADD COLUMN IF NOT EXISTS project_name TEXT;
ALTER TABLE experiences ADD COLUMN IF NOT EXISTS location TEXT;
ALTER TABLE experiences ADD COLUMN IF NOT EXISTS employment_type TEXT DEFAULT 'Full Time';
ALTER TABLE experiences ADD COLUMN IF NOT EXISTS description TEXT;
ALTER TABLE experiences ADD COLUMN IF NOT EXISTS responsibilities TEXT[];
ALTER TABLE experiences ADD COLUMN IF NOT EXISTS category TEXT DEFAULT 'Research';

-- ============================================================
-- publications — all extended fields (in base schema, but ensure)
-- ============================================================
ALTER TABLE publications ADD COLUMN IF NOT EXISTS academic_pdf TEXT;
ALTER TABLE publications ADD COLUMN IF NOT EXISTS citation_count INTEGER DEFAULT 0;
ALTER TABLE publications ADD COLUMN IF NOT EXISTS conference_title TEXT;
ALTER TABLE publications ADD COLUMN IF NOT EXISTS conference_organizer TEXT;
ALTER TABLE publications ADD COLUMN IF NOT EXISTS location TEXT;
ALTER TABLE publications ADD COLUMN IF NOT EXISTS conference_images TEXT[];
ALTER TABLE publications ADD COLUMN IF NOT EXISTS conference_videos TEXT[];
ALTER TABLE publications ADD COLUMN IF NOT EXISTS conference_paper_pdf TEXT;
ALTER TABLE publications ADD COLUMN IF NOT EXISTS keywords TEXT[];
ALTER TABLE publications ADD COLUMN IF NOT EXISTS abstract TEXT;
ALTER TABLE publications ADD COLUMN IF NOT EXISTS url TEXT;
ALTER TABLE publications ADD COLUMN IF NOT EXISTS journal TEXT;

-- ============================================================
-- volunteering — all form fields (in base schema, but ensure)
-- ============================================================
ALTER TABLE volunteering ADD COLUMN IF NOT EXISTS end_date TEXT;
ALTER TABLE volunteering ADD COLUMN IF NOT EXISTS description TEXT;

-- ============================================================
-- scholarly_activities — all form fields (in base schema, but ensure)
-- ============================================================
ALTER TABLE scholarly_activities ADD COLUMN IF NOT EXISTS organization TEXT;
ALTER TABLE scholarly_activities ADD COLUMN IF NOT EXISTS description TEXT;

-- ============================================================
-- media_coverage — cover_image (added in script 022)
-- ============================================================
ALTER TABLE media_coverage ADD COLUMN IF NOT EXISTS cover_image TEXT;

-- ============================================================
-- Verify: show column counts per table
-- ============================================================
SELECT 
  table_name,
  COUNT(*) as column_count
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name IN (
    'profiles', 'certifications', 'awards', 'skills',
    'education', 'experiences', 'publications',
    'volunteering', 'scholarly_activities', 'media_coverage'
  )
GROUP BY table_name
ORDER BY table_name;
