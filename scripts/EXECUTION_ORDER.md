# Execution Order - New Supabase Project

## 🎯 Simple 2-Step Process

```
┌─────────────────────────────────────────────────────────┐
│  STEP 1: Run Complete Setup Script                      │
│  File: 000_COMPLETE_SETUP_FROM_SCRATCH.sql              │
│  Creates: Tables + Storage + Policies                   │
└─────────────────────────────────────────────────────────┘
                        ↓
┌─────────────────────────────────────────────────────────┐
│  STEP 2: Run Seed Data Script                           │
│  File: 014_seed_bangladeshi_profile.sql                 │
│  Inserts: All portfolio data                            │
└─────────────────────────────────────────────────────────┘
                        ↓
                  ✅ DONE!
```

## 📝 Detailed Steps

### Step 1: Complete Setup (Run First)

**File**: `scripts/000_COMPLETE_SETUP_FROM_SCRATCH.sql`

**What it does**:
1. Creates all database tables
2. Creates admin_users table
3. Sets up Row Level Security (RLS)
4. Creates 6 storage buckets
5. Sets up storage policies
6. Creates performance indexes

**Execution**:
```sql
-- Copy entire file content and paste in Supabase SQL Editor
-- Click "Run"
```

**Expected Result**: ✅ Success message, no errors

---

### Step 2: Seed Data (Run Second)

**File**: `scripts/014_seed_bangladeshi_profile.sql`

**What it does**:
1. Clears any existing data
2. Inserts profile (Rifat Ahmed)
3. Inserts education records
4. Inserts experience records
5. Inserts publications (with media URLs)
6. Inserts skills, awards, volunteering, etc.

**Execution**:
```sql
-- Copy entire file content and paste in Supabase SQL Editor
-- Click "Run"
```

**Expected Result**: ✅ Success message, data inserted

---

## 🔄 Alternative: Using Supabase CLI

If you prefer command line:

```bash
# Step 1: Setup
supabase db execute --file scripts/000_COMPLETE_SETUP_FROM_SCRATCH.sql

# Step 2: Seed Data
supabase db execute --file scripts/014_seed_bangladeshi_profile.sql
```

---

## 📊 Verification After Each Step

### After Step 1 (Setup):

```sql
-- Check tables exist
SELECT COUNT(*) FROM information_schema.tables 
WHERE table_schema = 'public' 
AND table_name IN ('profiles', 'education', 'experiences', 'publications');

-- Check storage buckets
SELECT id, name FROM storage.buckets;
```

**Expected**: 11 tables, 6 buckets

---

### After Step 2 (Seed Data):

```sql
-- Check data inserted
SELECT 
  (SELECT COUNT(*) FROM profiles) as profiles,
  (SELECT COUNT(*) FROM education) as education,
  (SELECT COUNT(*) FROM experiences) as experiences,
  (SELECT COUNT(*) FROM publications) as publications;
```

**Expected**: 
- profiles: 1
- education: 3
- experiences: 5
- publications: 5

---

## ⚠️ Important Notes

1. **Order Matters**: Always run Step 1 before Step 2
2. **One-Time Setup**: Step 1 only needs to run once per project
3. **Re-runnable**: Step 2 can be run multiple times (clears data first)
4. **No Dependencies**: Step 1 is self-contained, no prerequisites

---

## 🎨 Visual Flow

```
New Supabase Project
        │
        ├─→ Open SQL Editor
        │
        ├─→ STEP 1: Run 000_COMPLETE_SETUP_FROM_SCRATCH.sql
        │   │
        │   ├─→ Creates Tables ✓
        │   ├─→ Creates Storage ✓
        │   └─→ Creates Policies ✓
        │
        ├─→ Verify Setup ✓
        │
        ├─→ STEP 2: Run 014_seed_bangladeshi_profile.sql
        │   │
        │   ├─→ Inserts Profile ✓
        │   ├─→ Inserts Education ✓
        │   ├─→ Inserts Experiences ✓
        │   ├─→ Inserts Publications ✓
        │   └─→ Inserts All Other Data ✓
        │
        └─→ Verify Data ✓
            │
            └─→ ✅ Ready to Use!
```

---

## 🚀 Quick Copy-Paste Commands

### For Supabase SQL Editor:

**Step 1**:
1. Open `scripts/000_COMPLETE_SETUP_FROM_SCRATCH.sql`
2. Select All (Ctrl+A)
3. Copy (Ctrl+C)
4. Paste in SQL Editor
5. Run (Ctrl+Enter)

**Step 2**:
1. Open `scripts/014_seed_bangladeshi_profile.sql`
2. Select All (Ctrl+A)
3. Copy (Ctrl+C)
4. Paste in SQL Editor
5. Run (Ctrl+Enter)

---

## ✅ Success Indicators

After both steps, you should see:

- ✅ No error messages in SQL Editor
- ✅ Tables visible in Table Editor
- ✅ Storage buckets visible in Storage section
- ✅ Data visible when querying tables
- ✅ Can upload files to storage buckets

---

## 🆘 If Errors Occur

1. **Check Error Message**: Read the full error in SQL Editor
2. **Verify Order**: Ensure Step 1 ran before Step 2
3. **Check Permissions**: Ensure you have admin access
4. **Re-run Step**: Scripts are idempotent (safe to re-run)

---

**Total Time**: ~5 minutes  
**Difficulty**: ⭐ Easy  
**Prerequisites**: New Supabase project

