-- Add highlights and coursework columns to education table
-- highlights: bullet points with **bold** markdown (one per line)
-- coursework: comma-separated course names with **bold** markdown

ALTER TABLE education ADD COLUMN IF NOT EXISTS highlights TEXT;
ALTER TABLE education ADD COLUMN IF NOT EXISTS coursework TEXT;
