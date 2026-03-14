-- Add image column to certifications table
ALTER TABLE certifications
ADD COLUMN IF NOT EXISTS image TEXT;
