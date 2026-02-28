# Bangladeshi Profile Seed Data

This directory contains seed data for a Bangladeshi profile with comprehensive portfolio information including images, PDFs, and videos.

## 📋 Files Overview

### 1. `014_seed_bangladeshi_profile.sql`
Main seed data file containing:
- **Profile**: Lamia Tasnim - Public Health Professional | Researcher | Mental Health Systems Advocate
- **Education**: MPH (North South University), BSc in Food & Nutrition (University of Dhaka)
- **Experiences**: Public health research + community mental health systems leadership
- **Publications**: Selected academic + conference contributions
- **Skills**: Public health analytics, program design, leadership, and languages
- **Awards**: Global Youth Leadership Award (Nepal)
- **Volunteering**: Community mental health and humanitarian engagement
- **Scholarly Activities**: Conference presentation and systems-building activities

### 2. `015_ensure_storage_setup.sql`
Master migration script that ensures:
- All necessary database columns exist
- All storage buckets are created
- All storage policies are configured
- Performance indexes are created

### 3. `016_execute_bangladeshi_seed.js`
Helper script to validate and guide execution of the migration scripts.

## 🚀 Quick Start

### Step 1: Run Storage Setup
Execute the storage setup script first to ensure all buckets and columns exist:

```sql
-- Run in Supabase SQL Editor or via psql
\i scripts/015_ensure_storage_setup.sql
```

### Step 2: Run Seed Data
Execute the seed data script:

```sql
-- Run in Supabase SQL Editor or via psql
\i scripts/014_seed_bangladeshi_profile.sql
```

### Alternative: Using Supabase CLI

```bash
# Ensure storage setup
supabase db execute --file scripts/015_ensure_storage_setup.sql

# Insert seed data
supabase db execute --file scripts/014_seed_bangladeshi_profile.sql
```

## 📸 Media Files

The seed data includes placeholder URLs for:
- **Profile Image**: `/placeholder-user.jpg`
- **Award Images**: Unsplash placeholder URLs (replace with actual images)
- **Conference Images**: Unsplash placeholder URLs for conference presentations
- **Academic PDFs**: Google Storage placeholder URLs (replace with actual PDFs)
- **Conference PDFs**: Google Storage placeholder URLs (replace with actual PDFs)
- **Conference Videos**: Google Storage placeholder URLs (replace with actual videos)

### Uploading Media Files

1. **Profile Image**: Upload to your public folder or Supabase Storage
2. **Award Images**: Upload to `award-images` bucket in Supabase Storage
3. **Conference Images**: Upload to `conference-images` bucket
4. **Academic PDFs**: Upload to `academic-pdfs` bucket
5. **Conference PDFs**: Upload to `conference-pdfs` bucket
6. **Conference Videos**: Upload to `conference-videos` bucket

After uploading, update the URLs in the database using the admin panel or SQL:

```sql
-- Example: Update profile image
UPDATE profiles 
SET profile_image = 'https://your-supabase-url.supabase.co/storage/v1/object/public/profile-images/lamia-tasnim.jpg'
WHERE full_name = 'Lamia Tasnim';

-- Example: Update award image
UPDATE awards 
SET image = 'https://your-supabase-url.supabase.co/storage/v1/object/public/award-images/best-paper-award.jpg'
WHERE title = 'Best Paper Award';
```

## 🗂️ Database Structure

### Storage Buckets Created:
- `academic-pdfs` - For academic publication PDFs
- `award-images` - For award certificate images
- `conference-images` - For conference presentation images
- `conference-pdfs` - For conference paper PDFs
- `conference-videos` - For conference presentation videos

### Tables Populated:
- `profiles` - 1 record
- `education` - 2 records
- `experiences` - 4 records
- `publications` - 2 records
- `skills` - 17 records
- `awards` - 1 record
- `volunteering` - 4 records
- `scholarly_activities` - 3 records
- `certifications` - 0 records

## 📊 Seed Data Details

### Profile Information
- **Name**: Lamia Tasnim
- **Title**: Public Health Professional | Researcher | Mental Health Systems Advocate (Bangladesh)
- **Email**: contact@lamia-tasnim.org *(update as needed)*
- **Address**: Dhaka, Bangladesh

### Education
1. **North South University** - Master of Public Health (MPH) - CGPA: 3.25
2. **University of Dhaka** - BSc in Food & Nutrition - CGPA: 3.38

### Key Experiences
1. **Leadership & Program Development (Mental Health Systems)** at Let’s Talk Mental Health (LTMH)
2. **Founder & Lead** at BrainWaves (Teacher Training Initiative)
3. **Public Health Researcher** (Public health, mental health, and digital health)
4. **Humanitarian & Crisis Response** (psychosocial support-informed engagement)

### Publications
1. Hyper-Tuned Vision Transformer + Explainable AI for Eye Disease Detection (ICTBJ-2023)
2. Federated Learning in Healthcare: Security, Ethics, and Future Directions (Systematic Review)

## 🔧 Troubleshooting

### Issue: Storage buckets not created
**Solution**: Run `015_ensure_storage_setup.sql` first before seed data.

### Issue: Foreign key constraints
**Solution**: The seed data script clears existing data first. If you have foreign key constraints, you may need to disable them temporarily.

### Issue: RLS policies blocking inserts
**Solution**: Ensure you're authenticated as an admin user or temporarily disable RLS for seed data insertion.

### Issue: Media files not displaying
**Solution**: 
1. Verify files are uploaded to correct storage buckets
2. Check storage bucket policies allow public read access
3. Verify URLs in database match actual file paths in storage

## 📝 Customization

To customize the seed data:
1. Edit `014_seed_bangladeshi_profile.sql`
2. Modify the INSERT statements with your desired data
3. Update media file URLs after uploading to storage
4. Re-run the seed script

## ✅ Verification

After running the scripts, verify the data:

```sql
-- Check profile
SELECT * FROM profiles;

-- Check all records
SELECT 
  (SELECT COUNT(*) FROM profiles) as profiles,
  (SELECT COUNT(*) FROM education) as education,
  (SELECT COUNT(*) FROM experiences) as experiences,
  (SELECT COUNT(*) FROM publications) as publications,
  (SELECT COUNT(*) FROM skills) as skills,
  (SELECT COUNT(*) FROM awards) as awards,
  (SELECT COUNT(*) FROM volunteering) as volunteering,
  (SELECT COUNT(*) FROM scholarly_activities) as scholarly_activities,
  (SELECT COUNT(*) FROM certifications) as certifications;
```

Expected counts:
- Profiles: 1
- Education: 3
- Experiences: 5
- Publications: 5
- Skills: 16
- Awards: 4
- Volunteering: 5
- Scholarly Activities: 5
- Certifications: 7

## 🎯 Next Steps

1. Upload actual media files to Supabase Storage
2. Update URLs in the database
3. Customize the profile data as needed
4. Test the portfolio website with the new data

## 📞 Support

If you encounter any issues:
1. Check the Supabase logs
2. Verify all migration scripts ran successfully
3. Ensure storage buckets are properly configured
4. Check RLS policies are set correctly

