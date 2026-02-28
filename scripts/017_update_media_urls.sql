-- Helper script to update media URLs after uploading files to Supabase Storage
-- Replace 'YOUR_SUPABASE_URL' with your actual Supabase project URL
-- Example: https://abcdefghijklmnop.supabase.co

-- ============================================
-- PROFILE IMAGE
-- ============================================
-- Update profile image URL
-- IMPORTANT: Upload the profile photo first
-- See scripts/018_ADD_PROFILE_IMAGE.md for detailed instructions
-- Replace 'lamia-tasnim-profile.jpg' with your actual file name
UPDATE profiles 
SET profile_image = 'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/profile-images/lamia-tasnim-profile.jpg'
WHERE full_name = 'Lamia Tasnim';

-- ============================================
-- AWARD IMAGES
-- ============================================
UPDATE awards 
SET image = 'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/award-images/global-youth-leadership-award.jpg'
WHERE title = 'Global Youth Leadership Award';

-- ============================================
-- CONFERENCE IMAGES
-- ============================================
-- Example: Update ICTBJ-2023 conference presentation images (optional)
-- UPDATE publications 
-- SET conference_images = ARRAY[
--   'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/conference-images/ictbj-2023-1.jpg',
--   'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/conference-images/ictbj-2023-2.jpg'
-- ]
-- WHERE title LIKE '%Vision Transformer%';

-- ============================================
-- CONFERENCE PDFS
-- ============================================
-- Example: Update ICTBJ-2023 paper PDF (optional)
-- UPDATE publications 
-- SET conference_paper_pdf = 'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/conference-pdfs/ictbj-2023-paper.pdf'
-- WHERE title LIKE '%Vision Transformer%';

-- ============================================
-- ACADEMIC PDFS
-- ============================================
-- Example: Update academic PDF for systematic review (optional)
-- UPDATE publications 
-- SET academic_pdf = 'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/academic-pdfs/federated-learning-healthcare-review.pdf'
-- WHERE title LIKE '%Federated Learning in Healthcare%';

-- ============================================
-- CONFERENCE VIDEOS
-- ============================================
-- Example: Update conference presentation video (optional)
-- UPDATE publications 
-- SET conference_videos = ARRAY[
--   'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/conference-videos/ictbj-2023-presentation.mp4'
-- ]
-- WHERE title LIKE '%Vision Transformer%';

-- ============================================
-- VERIFICATION QUERIES
-- ============================================
-- Run these queries to verify URLs are updated correctly

-- Check profile image
SELECT full_name, profile_image FROM profiles;

-- Check award images
SELECT title, image FROM awards WHERE image IS NOT NULL;

-- Check conference publications with images
SELECT 
  title, 
  conference_images,
  conference_paper_pdf,
  conference_videos
FROM publications 
WHERE category = 'Conference Publication';

-- Check academic publications with PDFs
SELECT 
  title,
  academic_pdf,
  citation_count
FROM publications 
WHERE academic_pdf IS NOT NULL;

