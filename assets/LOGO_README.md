# StreamFlix Logo Design

## Logo Concept
**StreamFlix** - A Netflix-style streaming app logo featuring:
- **Color Scheme:** Netflix Red (#E50914) background
- **Typography:** Bold, modern sans-serif font
- **Icon:** Play button symbol representing streaming content
- **Style:** Clean, professional, entertainment-focused

## Design Elements
- **Background:** Rounded rectangle in Netflix signature red
- **Text:** "STREAM" and "FLIX" in white, bold typography
- **Icon:** White play triangle positioned between the text
- **Decorative:** Subtle white dots for visual interest

## Usage in Flutter App

### 1. Add to pubspec.yaml
```yaml
flutter:
  assets:
    - assets/streamflix_logo.svg
    - assets/streamflix_logo.png
```

### 2. Use in App
```dart
// For SVG (recommended for scalability)
SvgPicture.asset('assets/streamflix_logo.svg')

// For PNG
Image.asset('assets/streamflix_logo.png')
```

## Logo Files Created
- ✅ `streamflix_logo.svg` - Scalable vector format (recommended)
- 📋 `streamflix_logo.png` - To be created (raster format)

## Color Palette
- **Primary Red:** #E50914 (Netflix Red)
- **White:** #FFFFFF
- **Transparency:** Used for decorative elements

## Alternative Logo Variations

### Dark Theme Version
```svg
<rect width="200" height="60" rx="8" fill="#000000"/>
<text x="20" y="25" fill="#E50914">STREAM</text>
<text x="95" y="25" fill="#E50914">FLIX</text>
```

### Compact Version (Icon Only)
```svg
<svg width="60" height="60" viewBox="0 0 60 60">
  <circle cx="30" cy="30" r="28" fill="#E50914"/>
  <polygon points="20,18 20,42 40,30" fill="white"/>
</svg>
```

## Brand Guidelines
- Use Netflix Red (#E50914) as primary brand color
- Maintain aspect ratio when resizing
- Ensure good contrast on various backgrounds
- Keep logo clearly legible at all sizes

## Logo Files Location
📁 `assets/streamflix_logo.svg` - Ready to use in Flutter app

## Next Steps
1. Add logo files to pubspec.yaml assets
2. Use in app bar, splash screen, or about page
3. Consider creating different sizes for various use cases
4. Test logo visibility in both light and dark themes
