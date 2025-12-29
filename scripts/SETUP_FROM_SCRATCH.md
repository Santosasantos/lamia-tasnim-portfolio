# Complete Setup Guide - New Supabase Project

This guide will help you set up the entire portfolio database from scratch in a **new Supabase project**.

## 📋 Prerequisites

1. A new Supabase project created at [supabase.com](https://supabase.com)
2. Access to your Supabase project dashboard
3. SQL Editor access in Supabase Dashboard

## 🚀 Step-by-Step Setup

### Step 1: Create New Supabase Project

1. Go to [supabase.com](https://supabase.com)
2. Click **"New Project"**
3. Fill in:
   - **Project Name**: `portfolio-project` (or your preferred name)
   - **Database Password**: Create a strong password (save it!)
   - **Region**: Choose closest to you
4. Click **"Create new project"**
5. Wait for project to initialize (2-3 minutes)

### Step 2: Access SQL Editor

1. In your Supabase Dashboard, go to **SQL Editor** (left sidebar)
2. Click **"New Query"**

### Step 3: Run Complete Setup Script

1. Open the file: `scripts/000_COMPLETE_SETUP_FROM_SCRATCH.sql`
2. Copy the entire contents
3. Paste into Supabase SQL Editor
4. Click **"Run"** (or press `Ctrl+Enter`)
5. Wait for execution to complete (should show "Success")

**This script creates:**
- ✅ All database tables (profiles, education, experiences, publications, etc.)
- ✅ Admin users table
- ✅ Row Level Security (RLS) policies
- ✅ All storage buckets (6 buckets)
- ✅ Storage policies for all buckets
- ✅ Performance indexes

### Step 4: Verify Tables Created

Run this query in SQL Editor to verify:

```sql
SELECT 
  table_name,
  (SELECT COUNT(*) FROM information_schema.columns 
   WHERE table_name = t.table_name) as column_count
FROM information_schema.tables t
WHERE table_schema = 'public'
  AND table_name IN (
    'profiles', 'education', 'experiences', 'publications',
    'skills', 'awards', 'volunteering', 'scholarly_activities',
    'certifications', 'blogs', 'admin_users'
  )
ORDER BY table_name;
```

**Expected**: 11 tables should be listed

### Step 5: Verify Storage Buckets

1. Go to **Storage** in left sidebar
2. You should see 6 buckets:
   - ✅ `profile-images`
   - ✅ `academic-pdfs`
   - ✅ `award-images`
   - ✅ `conference-images`
   - ✅ `conference-pdfs`
   - ✅ `conference-videos`

### Step 6: Insert Seed Data

1. Open the file: `scripts/014_seed_bangladeshi_profile.sql`
2. Copy the entire contents
3. Paste into Supabase SQL Editor
4. Click **"Run"**
5. Wait for execution to complete

**This inserts:**
- ✅ 1 Profile (Rifat Ahmed)
- ✅ 3 Education records
- ✅ 5 Experience records
- ✅ 5 Publication records
- ✅ 16 Skill records
- ✅ 4 Award records
- ✅ 5 Volunteering records
- ✅ 5 Scholarly activity records
- ✅ 7 Certification records

### Step 7: Verify Seed Data

Run this query to verify data was inserted:

```sql
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

**Expected Results:**
- profiles: **1**
- education: **3**
- experiences: **5**
- publications: **5**
- skills: **16**
- awards: **4**
- volunteering: **5**
- scholarly_activities: **5**
- certifications: **7**

### Step 8: Configure Environment Variables

1. Go to **Settings** → **API** in Supabase Dashboard
2. Copy these values:
   - **Project URL**
   - **anon/public key**
   - **service_role key** (keep secret!)

3. Update your `.env.local` file (or create it):

```env
NEXT_PUBLIC_SUPABASE_URL=your-project-url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

### Step 9: Set Up Authentication (Optional)

If you want admin authentication:

1. Go to **Authentication** → **Users** in Supabase Dashboard
2. Click **"Add user"** → **"Create new user"**
3. Enter email and password
4. Copy the user ID
5. Insert into admin_users table:

```sql
INSERT INTO admin_users (id, email, full_name)
VALUES (
  'paste-user-id-here',
  'your-email@example.com',
  'Your Name'
);
```

## ✅ Setup Complete!

Your database is now ready! You should have:

- ✅ All tables created
- ✅ All storage buckets configured
- ✅ Seed data inserted
- ✅ RLS policies active
- ✅ Environment variables configured

## 🧪 Test Your Setup

### Test 1: Query Profile
```sql
SELECT full_name, title, email FROM profiles;
```

### Test 2: Query Publications
```sql
SELECT title, category, status FROM publications;
```

### Test 3: Check Storage Access
Go to Storage → `profile-images` → Try uploading a test image

## 📸 Next Steps: Upload Media Files

After setup, you can:

1. **Upload profile image** to `profile-images` bucket
2. **Upload award images** to `award-images` bucket
3. **Upload conference images** to `conference-images` bucket
4. **Upload PDFs** to `academic-pdfs` and `conference-pdfs` buckets
5. **Upload videos** to `conference-videos` bucket

Then update URLs using `scripts/017_update_media_urls.sql`

## 🆘 Troubleshooting

### Issue: "relation does not exist"
**Solution**: Make sure you ran `000_COMPLETE_SETUP_FROM_SCRATCH.sql` first

### Issue: "permission denied for schema storage"
**Solution**: This is normal for some operations. The storage buckets should still be created.

### Issue: "policy already exists"
**Solution**: This is fine - the script uses `DROP POLICY IF EXISTS` to handle this.

### Issue: RLS blocking queries
**Solution**: 
- Check that RLS policies were created
- Verify you're using the correct API keys
- For admin operations, ensure you're authenticated

### Issue: Storage buckets not visible
**Solution**:
1. Refresh the Storage page
2. Check if buckets were created: `SELECT * FROM storage.buckets;`
3. If missing, re-run the storage sections of the setup script

## 📚 Additional Resources

- **Full Documentation**: See `README_BANGLADESHI_SEED.md`
- **Quick Reference**: See `QUICK_START.md`
- **Media URLs**: See `017_update_media_urls.sql`

## 🎯 Summary

You've successfully:
1. ✅ Created all database tables
2. ✅ Set up storage buckets
3. ✅ Configured security policies
4. ✅ Inserted seed data
5. ✅ Configured environment variables

Your portfolio database is ready to use! 🎉

