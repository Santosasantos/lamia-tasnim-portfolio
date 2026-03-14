-- Add cover_image field to media_coverage table
ALTER TABLE media_coverage
ADD COLUMN IF NOT EXISTS cover_image TEXT;

-- Create storage bucket for media coverage images
INSERT INTO storage.buckets (id, name, public)
VALUES ('media-coverage-images', 'media-coverage-images', true)
ON CONFLICT (id) DO NOTHING;

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Public Access to Media Coverage Images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can upload media coverage images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can update media coverage images" ON storage.objects;
DROP POLICY IF EXISTS "Authenticated users can delete media coverage images" ON storage.objects;

-- Storage policies
CREATE POLICY "Public Access to Media Coverage Images"
ON storage.objects FOR SELECT
USING (bucket_id = 'media-coverage-images');

CREATE POLICY "Authenticated users can upload media coverage images"
ON storage.objects FOR INSERT
WITH CHECK (bucket_id = 'media-coverage-images' AND auth.uid() IS NOT NULL);

CREATE POLICY "Authenticated users can update media coverage images"
ON storage.objects FOR UPDATE
USING (bucket_id = 'media-coverage-images' AND auth.uid() IS NOT NULL);

CREATE POLICY "Authenticated users can delete media coverage images"
ON storage.objects FOR DELETE
USING (bucket_id = 'media-coverage-images' AND auth.uid() IS NOT NULL);

-- Update existing seed data with display_order to ensure latest is first
UPDATE media_coverage SET display_order = 4 WHERE outlet_name = 'The Bangladesh Today';
UPDATE media_coverage SET display_order = 3 WHERE outlet_name = 'Daily Janakantha';
UPDATE media_coverage SET display_order = 2 WHERE outlet_name = 'RisingBD';
UPDATE media_coverage SET display_order = 1 WHERE outlet_name = 'Lalmonirhat Barta';

-- Verify
SELECT id, outlet_name, display_order, cover_image FROM media_coverage ORDER BY display_order DESC;
