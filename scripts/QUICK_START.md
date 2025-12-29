# Quick Start Guide - Bangladeshi Seed Data

## 🚀 Fast Execution (3 Steps)

### Step 1: Setup Storage Infrastructure
```sql
-- Run in Supabase SQL Editor
\i scripts/015_ensure_storage_setup.sql
```

### Step 2: Insert Seed Data
```sql
-- Run in Supabase SQL Editor
\i scripts/014_seed_bangladeshi_profile.sql
```

### Step 3: Verify Data
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

**Expected Output:**
- profiles: 1
- education: 3
- experiences: 5
- publications: 5
- skills: 16
- awards: 4
- volunteering: 5
- scholarly_activities: 5
- certifications: 7

## 📋 Alternative Methods

### Using Supabase CLI
```bash
supabase db execute --file scripts/015_ensure_storage_setup.sql
supabase db execute --file scripts/014_seed_bangladeshi_profile.sql
```

### Using psql
```bash
psql -h YOUR_DB_HOST -U postgres -d postgres -f scripts/015_ensure_storage_setup.sql
psql -h YOUR_DB_HOST -U postgres -d postgres -f scripts/014_seed_bangladeshi_profile.sql
```

### Using Node.js (Validation Only)
```bash
node scripts/016_execute_bangladeshi_seed.js
```

## 📸 Upload Media Files (Optional)

After seed data is inserted:

1. **Upload files to Supabase Storage** via Dashboard or API
2. **Update URLs** using `017_update_media_urls.sql` (replace `YOUR_SUPABASE_URL`)

## ✅ Success Indicators

- ✅ All tables have expected record counts
- ✅ Storage buckets visible in Supabase Dashboard
- ✅ Profile visible on portfolio website
- ✅ No SQL errors in execution logs

## 🆘 Quick Troubleshooting

**Problem**: Storage buckets not found  
**Solution**: Run `015_ensure_storage_setup.sql` first

**Problem**: RLS blocking inserts  
**Solution**: Ensure you're authenticated as admin

**Problem**: Foreign key errors  
**Solution**: Script clears data first, but check constraints if issues persist

## 📚 Full Documentation

See `README_BANGLADESHI_SEED.md` for complete documentation.

