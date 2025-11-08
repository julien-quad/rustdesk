# Branding Customization Guide for Technic informatique

This document describes all the customizations made to RustDesk to create a branded version for Technic informatique (https://technic-informatique.fr).

## Changes Made

### 1. Application Name
The application has been renamed to **"Assistance Technic informatique"** in all configuration files and user interfaces.

### 2. Temporary Password
The default temporary password has been changed from a randomly generated password to a fixed password: `&aqw1AQW`

**Modified file:**
- `libs/hbb_common/src/config.rs` - Functions `get_auto_password()` and `get_auto_numeric_password()`

### 3. Configuration Files Updated

#### Main Project
- **Cargo.toml**
  - Authors: `Technic informatique <contact@technic-informatique.fr>`
  - Description: `Assistance Technic informatique`
  - ProductName (Windows): `Assistance Technic informatique`
  - Bundle name: `Assistance Technic informatique`
  - Bundle identifier: `fr.technic-informatique.assistance`

#### Flutter Project
- **flutter/pubspec.yaml**
  - Description: `Assistance Technic informatique`

#### Android
- **flutter/android/app/src/main/res/values/strings.xml**
  - app_name: `Assistance Technic informatique`
  
- **flutter/android/app/src/main/AndroidManifest.xml**
  - Application label: `Assistance Technic informatique`
  - Input service label: `Assistance Technic informatique Input`

#### iOS
- **flutter/ios/Runner/Info.plist**
  - CFBundleDisplayName: `Assistance Technic informatique`
  - CFBundleName: `Assistance Technic informatique`

#### Linux
- **res/rustdesk.desktop**
  - Name: `Assistance Technic informatique`
  
- **res/rustdesk-link.desktop**
  - Name: `Assistance Technic informatique`

### 4. User Interface Strings
All language files (49 files in `src/lang/`) have been updated to replace user-facing "RustDesk" references with "Technic informatique":
- Network connection messages
- Permission request dialogs
- Application settings references
- Service names
- Installation prompts
- Branding/attribution text

## Logo and Icon Replacement

### Main Application Icons/Logos to Replace

These are the primary icon and logo files that should be replaced with Technic informatique branding:

#### Desktop Application Icons
1. **res/icon.png** - Main application icon (source image)
2. **res/icon.ico** - Windows icon file
3. **res/mac-icon.png** - macOS application icon (source)
4. **res/32x32.png** - 32x32 icon variant
5. **res/64x64.png** - 64x64 icon variant  
6. **res/128x128.png** - 128x128 icon variant
7. **res/128x128@2x.png** - 128x128 @2x (retina) variant

#### System Tray Icons
8. **res/tray-icon.ico** - Windows system tray icon
9. **res/mac-tray-dark-x2.png** - macOS tray icon (dark mode)
10. **res/mac-tray-light-x2.png** - macOS tray icon (light mode)

#### Logo Files (SVG)
11. **res/logo.svg** - Application logo
12. **res/logo-header.svg** - Header logo
13. **res/design.svg** - Design source file
14. **res/scalable.svg** - Scalable logo variant
15. **res/rustdesk-banner.svg** - Banner image
16. **flutter/assets/icon.svg** - Flutter app icon

### Flutter Mobile Icons

#### Android Icons
Located in `flutter/android/app/src/main/res/`:

**Launcher Icons** (various densities):
- mipmap-mdpi/ic_launcher.png (48x48)
- mipmap-hdpi/ic_launcher.png (72x72)
- mipmap-xhdpi/ic_launcher.png (96x96)
- mipmap-xxhdpi/ic_launcher.png (144x144)
- mipmap-xxxhdpi/ic_launcher.png (192x192)

**Launcher Foreground** (adaptive icons):
- mipmap-mdpi/ic_launcher_foreground.png
- mipmap-hdpi/ic_launcher_foreground.png
- mipmap-xhdpi/ic_launcher_foreground.png
- mipmap-xxhdpi/ic_launcher_foreground.png
- mipmap-xxxhdpi/ic_launcher_foreground.png

**Round Icons**:
- mipmap-mdpi/ic_launcher_round.png
- mipmap-hdpi/ic_launcher_round.png
- mipmap-xhdpi/ic_launcher_round.png
- mipmap-xxhdpi/ic_launcher_round.png
- mipmap-xxxhdpi/ic_launcher_round.png

**Status Bar Logo**:
- mipmap-mdpi/ic_stat_logo.png
- mipmap-hdpi/ic_stat_logo.png
- mipmap-xhdpi/ic_stat_logo.png
- mipmap-xxhdpi/ic_stat_logo.png
- mipmap-xxxhdpi/ic_stat_logo.png

**Fastlane Metadata**:
- fastlane/metadata/android/en-US/images/icon.png

#### iOS Icons
Located in `flutter/ios/Runner/Assets.xcassets/AppIcon.appiconset/`:
- Icon-App-1024x1024@1x.png
- Icon-App-20x20@1x.png, @2x.png, @3x.png
- Icon-App-29x29@1x.png, @2x.png, @3x.png
- Icon-App-40x40@1x.png, @2x.png, @3x.png
- Icon-App-60x60@2x.png, @3x.png
- Icon-App-76x76@1x.png, @2x.png
- Icon-App-83.5x83.5@2x.png

#### macOS Icons
- **flutter/macos/Runner/AppIcon.icns** - macOS icon bundle

#### Windows Icons
- **flutter/windows/runner/resources/app_icon.ico** - Windows Flutter app icon

### Launch Images (iOS)
Located in `flutter/ios/Runner/Assets.xcassets/LaunchImage.imageset/`:
- LaunchImage.png
- LaunchImage@2x.png
- LaunchImage@3x.png

## How to Replace Icons/Logos

### Automated Icon Generation
The project uses `flutter_launcher_icons` for generating app icons. After replacing the source images:

1. Replace the source icon file:
   - **res/icon.png** - Main source for most platforms
   - **res/mac-icon.png** - macOS specific source

2. Run the Flutter icon generator:
   ```bash
   cd flutter
   flutter pub run flutter_launcher_icons
   ```

This will automatically generate all the required icon sizes for Android, iOS, Windows, macOS, and Linux.

### Manual Icon Replacement
For icons not covered by the automated tool:

1. **System Tray Icons**: Replace the tray icon files with appropriate sizes (typically 16x16 or 22x22 for normal, 32x32 or 44x44 for retina)
2. **SVG Logos**: Replace SVG files maintaining the same viewBox dimensions for consistency
3. **Windows ICO**: Use an ICO creation tool to bundle multiple sizes (16, 32, 48, 64, 128, 256)

### Recommended Image Sizes

| File | Recommended Size |
|------|-----------------|
| res/icon.png | 1024x1024 (will be scaled down) |
| res/mac-icon.png | 1024x1024 |
| res/tray-icon.ico | 16x16, 32x32, 48x48 (multi-size ICO) |
| res/mac-tray-*.png | 44x44 (@2x for 22x22 display) |
| SVG files | Scalable (maintain viewBox) |

## Technical References Preserved

The following technical references were intentionally kept as "RustDesk" for maintenance purposes:
- Internal code comments
- Protocol/network identifiers
- File paths and executable names
- Package identifiers (where required for compatibility)
- Technical documentation references

## Build Process

After replacing icons and logos, rebuild the application:

### Desktop
```bash
# Build with Flutter
python3 build.py --flutter

# Or with Cargo for Rust components
cargo build --release
```

### Android
```bash
cd flutter
flutter build apk
# or
flutter build appbundle
```

### iOS
```bash
cd flutter
flutter build ios
```

## Notes

1. **Icon Quality**: Ensure all replacement icons are high-quality and meet platform guidelines:
   - Android: Material Design guidelines
   - iOS: Apple Human Interface Guidelines
   - Windows: Windows App Icon Guidelines
   - macOS: macOS Human Interface Guidelines

2. **Color Profiles**: Use sRGB color profile for all images for consistent rendering across platforms.

3. **Transparency**: 
   - Android adaptive icons should have transparent backgrounds
   - iOS icons should not have transparency (use white/colored background)
   - System tray icons should support transparency

4. **Testing**: After replacing icons, test on all target platforms to ensure proper rendering at all sizes.

## Contact

For questions about this customization:
- Website: https://technic-informatique.fr
- Email: contact@technic-informatique.fr
