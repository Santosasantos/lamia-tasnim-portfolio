-- Helper script to update media URLs after uploading files to Supabase Storage
-- Replace 'YOUR_SUPABASE_URL' with your actual Supabase project URL
-- Example: https://abcdefghijklmnop.supabase.co

-- ============================================
-- PROFILE IMAGE
-- ============================================
-- Update profile image URL
-- IMPORTANT: Upload a realistic photo of a Bangladeshi male professional first
-- See scripts/018_ADD_PROFILE_IMAGE.md for detailed instructions
-- Replace 'rifat-ahmed-profile.jpg' with your actual file name
UPDATE profiles 
SET profile_image = 'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/profile-images/rifat-ahmed-profile.jpg'
WHERE full_name = 'Rifat Ahmed';

-- ============================================
-- AWARD IMAGES
-- ============================================
-- Update Best Paper Award image
UPDATE awards 
SET image = 'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/award-images/best-paper-award.jpg'
WHERE title = 'Best Paper Award';

-- Update BUET Programming Contest Champion image
UPDATE awards 
SET image = 'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/award-images/buet-programming-champion.jpg'
WHERE title = 'Champion' AND issuer = 'BUET Programming Contest 2022';

-- Update Dean's List image
UPDATE awards 
SET image = 'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/award-images/deans-list.jpg'
WHERE title = 'Dean''s List';

-- Update Outstanding Intern Award image
UPDATE awards 
SET image = 'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/award-images/outstanding-intern.jpg'
WHERE title = 'Outstanding Intern Award';

-- ============================================
-- CONFERENCE IMAGES
-- ============================================
-- Update IEEE Healthcare Conference images
UPDATE publications 
SET conference_images = ARRAY[
  'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/conference-images/ieee-healthcare-1.jpg',
  'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/conference-images/ieee-healthcare-2.jpg',
  'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/conference-images/ieee-healthcare-3.jpg'
]
WHERE title LIKE '%AI-Powered Disease Prediction%';

-- Update AI Agriculture Conference images
UPDATE publications 
SET conference_images = ARRAY[
  'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/conference-images/ai-agriculture-1.jpg',
  'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/conference-images/ai-agriculture-2.jpg'
]
WHERE title LIKE '%Machine Learning Applications in Agriculture%';

-- ============================================
-- CONFERENCE PDFS
-- ============================================
-- Update IEEE Healthcare Conference paper PDF
UPDATE publications 
SET conference_paper_pdf = 'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/conference-pdfs/ai-healthcare-bangladesh.pdf'
WHERE title LIKE '%AI-Powered Disease Prediction%';

-- Update AI Agriculture Conference paper PDF
UPDATE publications 
SET conference_paper_pdf = 'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/conference-pdfs/ml-agriculture.pdf'
WHERE title LIKE '%Machine Learning Applications in Agriculture%';

-- ============================================
-- ACADEMIC PDFS
-- ============================================
-- Update Fintech Solutions PDF
UPDATE publications 
SET academic_pdf = 'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/academic-pdfs/fintech-bangladesh.pdf'
WHERE title LIKE '%Fintech Solutions for Financial Inclusion%';

-- ============================================
-- CONFERENCE VIDEOS
-- ============================================
-- Update IEEE Healthcare Conference video
UPDATE publications 
SET conference_videos = ARRAY[
  'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/conference-videos/ai-healthcare-presentation.mp4'
]
WHERE title LIKE '%AI-Powered Disease Prediction%';

-- Update AI Agriculture Conference video
UPDATE publications 
SET conference_videos = ARRAY[
  'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/conference-videos/ml-agriculture-presentation.mp4'
]
WHERE title LIKE '%Machine Learning Applications in Agriculture%';

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

