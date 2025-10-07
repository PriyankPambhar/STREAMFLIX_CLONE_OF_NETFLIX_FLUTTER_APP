# StreamFlix Logo - PNG Version

Since Flutter apps sometimes require PNG logos for certain use cases (app icons, notifications, etc.), here's how to create a PNG version of your logo:

## Option 1: Convert SVG to PNG (Recommended)

### Using Online Tools:
1. Open your `streamflix_logo.svg` file
2. Go to an online SVG to PNG converter:
   - https://cloudconvert.com/svg-to-png
   - https://convertio.co/svg-png/
   - https://www.svg2png.com/
3. Upload your SVG file
4. Download the PNG version

### Using Command Line (if you have ImageMagick):
```bash
# Install ImageMagick first: https://imagemagick.org/
convert streamflix_logo.svg -background transparent streamflix_logo.png
```

## Option 2: Create Multiple Sizes

For different use cases, create these PNG sizes:
- `streamflix_logo_48.png` - 48x48px (notifications)
- `streamflix_logo_72.png` - 72x72px (app icons)
- `streamflix_logo_96.png` - 96x96px (splash screens)
- `streamflix_logo_144.png` - 144x144px (adaptive icons)
- `streamflix_logo_192.png` - 192x192px (app icons)
- `streamflix_logo_512.png` - 512x512px (app store)

## Option 3: Use Flutter to Generate PNG

Add this to your pubspec.yaml to generate PNG from SVG:
```yaml
dev_dependencies:
  flutter_svg: ^2.0.10
```

Then in your code:
```dart
import 'package:flutter_svg/flutter_svg.dart';

// Generate PNG from SVG
final pictureInfo = await vg.loadPicture(SvgStringLoader(svgContent), null);
final image = await pictureInfo.picture.toImage(width, height);
final pngBytes = await image.toByteData(format: ImageByteFormat.png);
```

## Adding PNG to Assets

Once you have PNG files, add them to pubspec.yaml:
```yaml
flutter:
  assets:
    - assets/streamflix_logo.svg
    - assets/streamflix_logo.png
    - assets/logos/  # For multiple sizes
```

## Logo Color Variations

### Light Theme (for splash screens):
- Background: White (#FFFFFF)
- Text: Netflix Red (#E50914)

### Dark Theme (current):
- Background: Netflix Red (#E50914)
- Text: White (#FFFFFF)

## File Structure
```
assets/
├── streamflix_logo.svg          # Main SVG logo
├── streamflix_logo.png          # Main PNG logo
└── logos/                       # Multiple sizes
    ├── icon_48.png
    ├── icon_72.png
    ├── icon_96.png
    ├── icon_144.png
    ├── icon_192.png
    └── icon_512.png
```

## Next Steps
1. Convert SVG to PNG using one of the methods above
2. Add PNG files to your assets folder
3. Update pubspec.yaml to include PNG assets
4. Use the logo in your app's UI
