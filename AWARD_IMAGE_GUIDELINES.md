# Award Image Guidelines

## Recommended Image Specifications

### Optimal Dimensions
- **Width**: 800px
- **Height**: 600px
- **Aspect Ratio**: 4:3
- **Format**: JPG or PNG
- **File Size**: Under 500KB (for fast loading)

### Alternative Acceptable Sizes
- 1200x900px (4:3 ratio)
- 1600x1200px (4:3 ratio)
- 400x300px (minimum, 4:3 ratio)

## Image Display Behavior

The award cards now use:
- **Height**: 256px (h-64)
- **Object Fit**: `cover` (fills the entire space)
- **Aspect Ratio**: Maintains 4:3 ratio
- **Background**: Gradient from gray-50 to gray-100

### What This Means:
- ✅ Images will fill the entire card space
- ✅ No white space or padding around images
- ✅ Images are centered and cropped if needed
- ✅ Consistent look across all award cards

## Image Preparation Tips

### 1. For Certificate/Award Photos
If you have a photo of yourself holding an award:
- Crop to focus on you and the certificate
- Ensure good lighting
- Remove unnecessary background
- Center yourself in the frame

### 2. For Certificate Scans
If you have a scanned certificate:
- Scan at 300 DPI minimum
- Crop to remove white borders
- Adjust brightness/contrast for clarity
- Save as JPG with 80-90% quality

### 3. For Award Logos/Badges
If you only have the award logo:
- Use a high-resolution version
- Add a colored background (not white)
- Center the logo
- Consider adding text overlay with award name

## Using Image Editing Tools

### Online Tools (Free):
1. **Canva** (canva.com)
   - Use "Custom Size" → 800x600px
   - Upload your image
   - Crop and adjust
   - Download as JPG

2. **Photopea** (photopea.com)
   - Free Photoshop alternative
   - Open image
   - Image → Canvas Size → 800x600px
   - Export as JPG

3. **Squoosh** (squoosh.app)
   - Compress images
   - Resize to 800x600px
   - Optimize file size

### Desktop Tools:
- **Windows**: Paint, Photos app
- **Mac**: Preview, Photos app
- **Cross-platform**: GIMP (free)

## Upload Process

1. **Prepare Image**
   - Resize to 800x600px (4:3 ratio)
   - Optimize file size (under 500KB)
   - Save as JPG or PNG

2. **Upload via Admin Panel**
   - Go to `/admin/awards`
   - Click on award to edit
   - Click "Choose File" under "Award Image"
   - Select your prepared image
   - Click "Update"

3. **Verify Display**
   - Visit homepage
   - Scroll to "Honors & Awards" section
   - Check that image displays properly
   - Image should fill the card completely

## Common Issues & Solutions

### Issue: Image is stretched or distorted
**Solution**: Ensure your image is 4:3 aspect ratio (800x600, 1200x900, etc.)

### Issue: Important parts are cut off
**Solution**: 
- Recrop your image to center the important content
- Leave some margin around key elements
- Use 4:3 ratio when cropping

### Issue: Image is blurry
**Solution**:
- Use higher resolution source image
- Don't upscale small images
- Scan certificates at 300 DPI minimum

### Issue: File won't upload
**Solution**:
- Check file size (should be under 10MB)
- Ensure format is JPG or PNG
- Try compressing with Squoosh.app

## Example Image Layouts

### Layout 1: Person with Certificate
```
┌─────────────────────────┐
│                         │
│    [Person holding]     │
│    [certificate in]     │
│    [center of frame]    │
│                         │
└─────────────────────────┘
```

### Layout 2: Certificate Only
```
┌─────────────────────────┐
│                         │
│   ┌───────────────┐    │
│   │  CERTIFICATE  │    │
│   │     TEXT      │    │
│   └───────────────┘    │
│                         │
└─────────────────────────┘
```

### Layout 3: Award Badge/Logo
```
┌─────────────────────────┐
│   [Colored Background]  │
│                         │
│      [Award Logo]       │
│                         │
│   [Award Name Text]     │
└─────────────────────────┘
```

## Best Practices

### DO:
✅ Use 4:3 aspect ratio (800x600px recommended)
✅ Center important content
✅ Use good lighting for photos
✅ Compress images for web
✅ Test on mobile and desktop

### DON'T:
❌ Use images smaller than 400x300px
❌ Upload huge files (over 2MB)
❌ Use white backgrounds (use colored)
❌ Crop too tightly (leave margin)
❌ Use low-quality scans

## Quick Checklist

Before uploading an award image:
- [ ] Image is 800x600px (or 4:3 ratio)
- [ ] File size is under 500KB
- [ ] Format is JPG or PNG
- [ ] Important content is centered
- [ ] Image is clear and well-lit
- [ ] Background is not plain white
- [ ] Tested on mobile view

## Technical Details

### Current Implementation:
```tsx
<div className="relative w-full h-64 bg-gradient-to-br from-gray-50 to-gray-100 overflow-hidden">
  <Image
    src={award.image}
    alt={award.title}
    fill
    className="object-cover"
    sizes="(max-width: 768px) 100vw, (max-width: 1024px) 50vw, 33vw"
  />
</div>
```

### Key Properties:
- `h-64`: Fixed height of 256px
- `object-cover`: Fills space, crops if needed
- `overflow-hidden`: Prevents image overflow
- `fill`: Next.js Image fills parent container
- Responsive `sizes` for optimal loading

## Support

If you need help preparing images:
1. Take a screenshot of your current image
2. Note what's wrong (stretched, cut off, blurry, etc.)
3. Use the online tools mentioned above
4. Follow the 800x600px guideline
5. Test upload in admin panel

Remember: Consistency is key! All award images should have similar dimensions and quality for a professional look.
