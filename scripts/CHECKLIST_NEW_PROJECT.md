# Setup Checklist - New Supabase Project

Use this checklist to ensure you complete all setup steps correctly.

## 📋 Pre-Setup

- [ ] Created new Supabase project at supabase.com
- [ ] Saved project password securely
- [ ] Have access to Supabase Dashboard
- [ ] Can access SQL Editor

## 🗄️ Database Setup

- [ ] Opened SQL Editor in Supabase Dashboard
- [ ] Copied `000_COMPLETE_SETUP_FROM_SCRATCH.sql` content
- [ ] Pasted into SQL Editor
- [ ] Executed script successfully (no errors)
- [ ] Verified 11 tables created (profiles, education, experiences, etc.)
- [ ] Verified admin_users table exists

## 🪣 Storage Setup

- [ ] Verified 6 storage buckets created:
  - [ ] `profile-images`
  - [ ] `academic-pdfs`
  - [ ] `award-images`
  - [ ] `conference-images`
  - [ ] `conference-pdfs`
  - [ ] `conference-videos`
- [ ] All buckets are public (visible in Storage section)

## 🔒 Security Setup

- [ ] RLS enabled on all tables
- [ ] Public read policies created
- [ ] Authenticated write policies created
- [ ] Storage policies created for all buckets

## 📊 Seed Data

- [ ] Copied `014_seed_bangladeshi_profile.sql` content
- [ ] Pasted into SQL Editor
- [ ] Executed script successfully
- [ ] Verified data counts:
  - [ ] Profiles: 1
  - [ ] Education: 3
  - [ ] Experiences: 5
  - [ ] Publications: 5
  - [ ] Skills: 16
  - [ ] Awards: 4
  - [ ] Volunteering: 5
  - [ ] Scholarly Activities: 5
  - [ ] Certifications: 7

## 🔑 Environment Variables

- [ ] Copied Project URL from Settings → API
- [ ] Copied anon/public key
- [ ] Copied service_role key (kept secret)
- [ ] Updated `.env.local` file with:
  - [ ] `NEXT_PUBLIC_SUPABASE_URL`
  - [ ] `NEXT_PUBLIC_SUPABASE_ANON_KEY`
  - [ ] `SUPABASE_SERVICE_ROLE_KEY`

## 👤 Authentication (Optional)

- [ ] Created admin user in Authentication → Users
- [ ] Copied user ID
- [ ] Inserted user into admin_users table
- [ ] Tested login functionality

## ✅ Verification Tests

- [ ] Can query profiles: `SELECT * FROM profiles;`
- [ ] Can query publications: `SELECT * FROM publications;`
- [ ] Can query all tables without errors
- [ ] Storage buckets accessible
- [ ] Can upload test file to storage

## 📸 Media Files (Optional - Later)

- [ ] Uploaded profile image
- [ ] Updated profile image URL in database
- [ ] Uploaded award images
- [ ] Updated award image URLs
- [ ] Uploaded conference images
- [ ] Updated conference image URLs
- [ ] Uploaded PDFs
- [ ] Updated PDF URLs
- [ ] Uploaded videos
- [ ] Updated video URLs

## 🎉 Final Checks

- [ ] All setup steps completed
- [ ] No errors in Supabase logs
- [ ] Database queries working
- [ ] Storage accessible
- [ ] Environment variables configured
- [ ] Ready to use portfolio application

---

## 🆘 If Something Goes Wrong

1. **Check Supabase Logs**: Go to Logs → Postgres Logs
2. **Verify Scripts**: Re-run setup scripts if needed
3. **Check Policies**: Verify RLS policies exist
4. **Storage Issues**: Re-check storage bucket creation
5. **Data Issues**: Re-run seed data script

## 📝 Notes

Write any custom notes or issues here:

```
Date: ___________
Project Name: ___________
Issues: ___________
Solutions: ___________
```

---

**Setup Date**: ___________  
**Completed By**: ___________  
**Status**: ⬜ In Progress | ⬜ Complete | ⬜ Issues Found

