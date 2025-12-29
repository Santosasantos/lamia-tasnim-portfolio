# Adding Profile Image for Rifat Ahmed

## 📸 Profile Image Requirements

You need to add a realistic photo of a **Bangladeshi male professional** for Rifat Ahmed.

### Image Specifications:
- **Format**: JPG or PNG
- **Size**: Recommended 800x800px or larger (square aspect ratio preferred)
- **Quality**: High resolution, professional headshot
- **Style**: Professional business/tech attire, clean background
- **Person**: Bangladeshi male, 20-30 years old, professional appearance

## 🎯 Where to Get the Image

### Option 1: Use AI-Generated Image
- Use services like:
  - **This Person Does Not Exist** (thispersondoesnotexist.com) - but may not be Bangladeshi
  - **Generated Photos** (generated.photos) - has diverse options
  - **Midjourney/DALL-E** - Generate with prompt: "Professional headshot of a Bangladeshi male software engineer, 25 years old, business casual, clean background, high quality"

### Option 2: Use Stock Photo
- **Unsplash** - Search for "Bangladeshi professional" or "South Asian male professional"
- **Pexels** - Free stock photos
- **Pixabay** - Free images

### Option 3: Use Placeholder Service
- **UI Avatars** - https://ui-avatars.com/?name=Rifat+Ahmed&background=036445&color=fff&size=400
- **DiceBear** - https://dicebear.com/ (has various styles)

## 📤 Upload to Supabase Storage

### Step 1: Upload Image
1. Go to your Supabase Dashboard
2. Navigate to **Storage** → **profile-images** bucket
3. Click **"Upload file"**
4. Select your image file
5. Name it: `rifat-ahmed-profile.jpg` (or `.png`)
6. Click **"Upload"**

### Step 2: Get Public URL
1. After upload, click on the uploaded file
2. Copy the **Public URL** (it will look like):
   ```
   https://your-project.supabase.co/storage/v1/object/public/profile-images/rifat-ahmed-profile.jpg
   ```

### Step 3: Update Database
Run this SQL query in Supabase SQL Editor:

```sql
UPDATE profiles 
SET profile_image = 'YOUR_PUBLIC_URL_HERE'
WHERE full_name = 'Rifat Ahmed';
```

Or use the helper script: `017_update_media_urls.sql` (update the profile image section)

## 🖼️ Example URLs

After uploading, your profile image URL should look like:
```
https://abcdefghijklmnop.supabase.co/storage/v1/object/public/profile-images/rifat-ahmed-profile.jpg
```

## ✅ Verification

After updating, verify the image displays:

```sql
SELECT full_name, profile_image FROM profiles WHERE full_name = 'Rifat Ahmed';
```

Then check your portfolio homepage - the profile image should display correctly.

## 🎨 Image Suggestions

For a realistic Bangladeshi professional look:
- **Hair**: Black, well-groomed
- **Skin tone**: South Asian complexion
- **Attire**: Business casual (collared shirt, or formal shirt)
- **Expression**: Friendly, professional smile
- **Background**: Neutral/clean (white, gray, or blurred office background)
- **Age**: Mid-20s to early 30s

## 📝 Quick SQL Update Script

```sql
-- Replace YOUR_SUPABASE_URL with your actual Supabase project URL
-- Replace rifat-ahmed-profile.jpg with your actual file name

UPDATE profiles 
SET profile_image = 'https://YOUR_SUPABASE_URL.supabase.co/storage/v1/object/public/profile-images/rifat-ahmed-profile.jpg'
WHERE full_name = 'Rifat Ahmed';

-- Verify
SELECT full_name, profile_image FROM profiles;
```

## 🔗 Alternative: Use External Image URL

If you prefer to host the image elsewhere:

```sql
UPDATE profiles 
SET profile_image = 'https://example.com/path/to/rifat-ahmed.jpg'
WHERE full_name = 'Rifat Ahmed';
```

---

**Note**: The seed data currently uses `/placeholder-user.jpg` as a placeholder. You should replace this with the actual uploaded image URL.

