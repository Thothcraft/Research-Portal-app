# Assets Directory

This directory contains all static assets for the ThothCraft Research mobile app.

## Structure

```
assets/
├── images/        # App images (backgrounds, illustrations, etc.)
├── icons/         # Custom icons
└── logos/         # App logos and branding
```

## Adding Assets

1. Place your asset files in the appropriate directory
2. Register them in `pubspec.yaml` under the `flutter.assets` section
3. Use in code:
   ```dart
   Image.asset('assets/images/your_image.png')
   ```

## Guidelines

- **Images**: Use PNG or JPEG. Provide @2x and @3x versions for different screen densities
- **Icons**: SVG preferred (use flutter_svg), or PNG at multiple densities
- **Logos**: Vector format (SVG) preferred for scalability

## Naming Convention

Use lowercase with underscores:
- `device_icon.png`
- `thoth_logo.svg`
- `splash_background.png`
