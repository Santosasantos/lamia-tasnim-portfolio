# Hero & Media Coverage Dynamic Setup Guide

## Overview

The hero section and media coverage section are now **fully dynamic** and customizable through the admin panel. All hardcoded text has been moved to the database.

---

## Database Migration

### Step 1: Run the SQL Migration

Execute the migration script to add new fields and tables:

```bash
# Connect to your Supabase project and run:
scripts/019_add_media_coverage_and_hero_fields.sql
```

This migration will:
1. Add hero customization fields to the `profiles` table
2. Create a new `media_coverage` table
3. Seed initial data for Lamia Tasnim

### New Database Fields

#### profiles table (new fields):
- `hero_badge_text` - Badge text (e.g., "Key Representative · Bangladesh")
- `hero_subtitle` - Subtitle below badge
- `show_credentials` - Boolean to show/hide credentials
- `credential_1_icon` - Icon name for first credential
- `credential_1_text` - Text for first credential
- `credential_2_icon` - Icon name for second credential
- `credential_2_text` - Text for second credential

#### media_coverage table (new):
- `outlet_name` - Name of media outlet
- `outlet_icon` - Emoji/icon for the outlet
- `article_title` - Title of the article (optional)
- `article_url` - Link to the article (optional)
- `publication_date` - When it was published
- `description` - Brief description
- `display_order` - Order of display
- `is_featured` - Show on homepage (boolean)

---

## Admin Panel Access

### 1. Profile Customization
Navigate to: `/admin/profile`

You can now customize:
- **Hero Badge Text**: The badge at the top ("Key Representative · Bangladesh")
- **Hero Subtitle**: The subtitle text below the badge
- **Credential 1**: First credential shown (e.g., "Global Youth Leadership Award")
- **Credential 2**: Second credential shown (e.g., "MPH, North South University")

### 2. Media Coverage Management
Navigate to: `/admin/media-coverage`

Features:
- **Add New Media Coverage**: Click "Add Media Coverage" button
- **Edit Existing**: Click "Edit" on any media outlet
- **Delete**: Remove media outlets
- **Featured Toggle**: Mark outlets to display on homepage
- **Article Links**: Add URLs to actual articles (optional)
- **Custom Icons**: Use emojis or icons for each outlet

---

## How It Works

### Hero Section
The hero section now pulls data from the `profiles` table:

```typescript
// Dynamic data from database
<span>{profile?.hero_badge_text || "Key Representative · Bangladesh"}</span>
<p>{profile?.hero_subtitle || "Representing Bangladesh..."}</p>

// Credentials
{profile?.credential_1_text && (
  <div>
    <Award className="h-4 w-4" />
    <span>{profile.credential_1_text}</span>
  </div>
)}
```

### Media Coverage Section
The media coverage section fetches from the `media_coverage` table:

```typescript
// Fetch featured media coverage
const { data: mediaCoverage } = await supabase
  .from("media_coverage")
  .select("*")
  .eq("is_featured", true)
  .order("display_order", { ascending: true })

// Display dynamically
{mediaCoverage?.map((outlet) => (
  <div key={outlet.id}>
    <span>{outlet.outlet_icon}</span>
    <span>{outlet.outlet_name}</span>
    {outlet.article_url && <a href={outlet.article_url}>Link</a>}
  </div>
))}
```

---

## Default Values

If no data is found in the database, the system falls back to default values:

### Hero Section Defaults:
- Badge: "Key Representative · Bangladesh"
- Subtitle: "Representing Bangladesh in Global Mental Health & Public Health"
- Credential 1: "Global Youth Leadership Award"
- Credential 2: "MPH, North South University"

### Media Coverage Defaults:
If no media coverage entries exist, it shows:
- The Bangladesh Today
- Daily Janakantha
- RisingBD
- Lalmonirhat Barta

---

## Customization Examples

### Example 1: Update Hero Badge
1. Go to `/admin/profile`
2. Find "Hero Section Customization"
3. Change "Hero Badge Text" to: "Leading Voice · Bangladesh"
4. Click "Save Profile"
5. Hero section updates immediately

### Example 2: Add New Media Outlet
1. Go to `/admin/media-coverage`
2. Click "Add Media Coverage"
3. Fill in:
   - Outlet Name: "Prothom Alo"
   - Icon: 📰
   - Description: "Featured in national daily"
   - Article URL: https://example.com/article
   - Toggle "Featured" ON
4. Click "Create"
5. New outlet appears in media coverage section

### Example 3: Link to Actual Articles
1. Go to `/admin/media-coverage`
2. Click "Edit" on any outlet
3. Add "Article URL": https://actual-article-link.com
4. Add "Article Title": "Youth Leader Making Impact"
5. Click "Update"
6. External link icon becomes clickable

---

## Features

### ✅ Fully Dynamic
- All text pulled from database
- No hardcoded values in production
- Real-time updates through admin panel

### ✅ Fallback Support
- Graceful degradation if database is empty
- Default values ensure site never breaks

### ✅ SEO Friendly
- Article URLs for media coverage
- Proper metadata from profile

### ✅ Easy Management
- Simple admin interface
- No code changes needed
- Drag-and-drop ordering (via display_order)

---

## Admin Panel Navigation

The admin sidebar now includes:
```
📊 Dashboard
👤 Profile (includes hero customization)
🎓 Education
💼 Experiences
📚 Publications
💡 Skills
🏆 Awards
📰 Media Coverage (NEW!)
📄 Certifications
❤️ Volunteering
🎓 Scholarly Activities
```

---

## Testing

### Test Hero Customization:
1. Go to `/admin/profile`
2. Change "Hero Badge Text" to "Test Badge"
3. Save
4. Visit homepage `/`
5. Verify badge shows "Test Badge"

### Test Media Coverage:
1. Go to `/admin/media-coverage`
2. Add a test outlet with a URL
3. Mark as "Featured"
4. Visit homepage `/`
5. Verify outlet appears in media coverage section
6. Click external link icon to test URL

---

## Database Schema

### profiles table additions:
```sql
ALTER TABLE profiles 
ADD COLUMN hero_badge_text TEXT DEFAULT 'Key Representative · Bangladesh',
ADD COLUMN hero_subtitle TEXT DEFAULT 'Representing Bangladesh...',
ADD COLUMN show_credentials BOOLEAN DEFAULT true,
ADD COLUMN credential_1_icon TEXT DEFAULT 'Award',
ADD COLUMN credential_1_text TEXT DEFAULT 'Global Youth Leadership Award',
ADD COLUMN credential_2_icon TEXT DEFAULT 'School',
ADD COLUMN credential_2_text TEXT DEFAULT 'MPH, North South University';
```

### media_coverage table:
```sql
CREATE TABLE media_coverage (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  outlet_name TEXT NOT NULL,
  outlet_icon TEXT DEFAULT '📰',
  article_title TEXT,
  article_url TEXT,
  publication_date TEXT,
  description TEXT,
  display_order INTEGER DEFAULT 0,
  is_featured BOOLEAN DEFAULT false,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

---

## Summary

✅ **Hero Section**: Fully customizable through `/admin/profile`
✅ **Media Coverage**: Fully manageable through `/admin/media-coverage`
✅ **No Hardcoded Text**: Everything pulled from database
✅ **Fallback Support**: Default values if database is empty
✅ **Easy Updates**: No code changes needed for content updates

All content can now be managed by non-technical users through the admin panel!
