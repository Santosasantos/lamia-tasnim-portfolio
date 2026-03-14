-- ============================================================
-- Ensure ALL storage buckets exist (safe to run multiple times)
-- ============================================================

-- Profile images
INSERT INTO storage.buckets (id, name, public)
VALUES ('profile-images', 'profile-images', true)
ON CONFLICT (id) DO NOTHING;

-- Certificate images
INSERT INTO storage.buckets (id, name, public)
VALUES ('certificate-images', 'certificate-images', true)
ON CONFLICT (id) DO NOTHING;

-- Award images
INSERT INTO storage.buckets (id, name, public)
VALUES ('award-images', 'award-images', true)
ON CONFLICT (id) DO NOTHING;

-- Academic PDFs
INSERT INTO storage.buckets (id, name, public)
VALUES ('academic-pdfs', 'academic-pdfs', true)
ON CONFLICT (id) DO NOTHING;

-- Conference images
INSERT INTO storage.buckets (id, name, public)
VALUES ('conference-images', 'conference-images', true)
ON CONFLICT (id) DO NOTHING;

-- Conference PDFs
INSERT INTO storage.buckets (id, name, public)
VALUES ('conference-pdfs', 'conference-pdfs', true)
ON CONFLICT (id) DO NOTHING;

-- Conference videos
INSERT INTO storage.buckets (id, name, public)
VALUES ('conference-videos', 'conference-videos', true)
ON CONFLICT (id) DO NOTHING;

-- Media coverage images
INSERT INTO storage.buckets (id, name, public)
VALUES ('media-coverage-images', 'media-coverage-images', true)
ON CONFLICT (id) DO NOTHING;

-- ============================================================
-- RLS policies: allow authenticated users to upload/read
-- (safe to run multiple times via DO $$ blocks)
-- ============================================================

DO $$
DECLARE
  buckets TEXT[] := ARRAY[
    'profile-images',
    'certificate-images',
    'award-images',
    'academic-pdfs',
    'conference-images',
    'conference-pdfs',
    'conference-videos',
    'media-coverage-images'
  ];
  b TEXT;
BEGIN
  FOREACH b IN ARRAY buckets LOOP
    -- Public read
    IF NOT EXISTS (
      SELECT 1 FROM pg_policies
      WHERE schemaname = 'storage' AND tablename = 'objects'
      AND policyname = b || '_public_read'
    ) THEN
      EXECUTE format(
        'CREATE POLICY %I ON storage.objects FOR SELECT USING (bucket_id = %L)',
        b || '_public_read', b
      );
    END IF;

    -- Authenticated upload
    IF NOT EXISTS (
      SELECT 1 FROM pg_policies
      WHERE schemaname = 'storage' AND tablename = 'objects'
      AND policyname = b || '_auth_insert'
    ) THEN
      EXECUTE format(
        'CREATE POLICY %I ON storage.objects FOR INSERT WITH CHECK (bucket_id = %L AND auth.uid() IS NOT NULL)',
        b || '_auth_insert', b
      );
    END IF;

    -- Authenticated update
    IF NOT EXISTS (
      SELECT 1 FROM pg_policies
      WHERE schemaname = 'storage' AND tablename = 'objects'
      AND policyname = b || '_auth_update'
    ) THEN
      EXECUTE format(
        'CREATE POLICY %I ON storage.objects FOR UPDATE USING (bucket_id = %L AND auth.uid() IS NOT NULL)',
        b || '_auth_update', b
      );
    END IF;

    -- Authenticated delete
    IF NOT EXISTS (
      SELECT 1 FROM pg_policies
      WHERE schemaname = 'storage' AND tablename = 'objects'
      AND policyname = b || '_auth_delete'
    ) THEN
      EXECUTE format(
        'CREATE POLICY %I ON storage.objects FOR DELETE USING (bucket_id = %L AND auth.uid() IS NOT NULL)',
        b || '_auth_delete', b
      );
    END IF;
  END LOOP;
END $$;
