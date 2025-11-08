# Customization Summary for Technic informatique

## ✅ COMPLETED CUSTOMIZATIONS

### 1. ✅ Temporary Password Changed
**New Password:** `&aqw1AQW`

The temporary password has been changed from a randomly generated password to the fixed password specified.

**Modified File:**
- `libs/hbb_common/src/config.rs`
  - Function: `get_auto_password()`
  - Function: `get_auto_numeric_password()`

### 2. ✅ Application Name Updated
**New Name:** "Assistance Technic informatique"

All configuration files have been updated with the new application name:

**Configuration Files Updated:**
- ✅ `Cargo.toml` - Rust project metadata
- ✅ `flutter/pubspec.yaml` - Flutter project description
- ✅ `flutter/android/app/src/main/res/values/strings.xml` - Android app name
- ✅ `flutter/android/app/src/main/AndroidManifest.xml` - Android labels
- ✅ `flutter/ios/Runner/Info.plist` - iOS bundle name and display name
- ✅ `res/rustdesk.desktop` - Linux desktop entry
- ✅ `res/rustdesk-link.desktop` - Linux URL handler

### 3. ✅ Branding Replaced
**From:** "RustDesk"
**To:** "Technic informatique"

All user-facing text has been updated in 28 language files:

**Language Files Updated (src/lang/):**
ar, bg, cn, da, en, es, et, eu, fa, fr, he, hr, hu, it, ja, lv, nb, nl, pl, pt_PT, ptbr, ro, sk, sq, sr, sv, uk, vi

**Examples of Updated Strings:**
- "Connecting to the Technic informatique network..."
- "grant Technic informatique permissions"
- "Assistance Technic informatique Input" service
- "Powered by Technic informatique"

### 4. ✅ Icon/Logo Documentation Complete

**Documentation File Created:** `BRANDING_CUSTOMIZATION.md`

This comprehensive guide includes:
- Complete list of all icon files (100+ files)
- Platform-specific icon locations (Android, iOS, Windows, macOS, Linux)
- Recommended sizes and formats
- Automated icon generation instructions
- Manual replacement procedures

## 📦 WHAT'S NEXT

### Icon Replacement
To complete the visual branding, replace the icon/logo files documented in `BRANDING_CUSTOMIZATION.md`:

**Primary Icons to Replace:**
1. `res/icon.png` - Main source icon (1024x1024)
2. `res/mac-icon.png` - macOS source icon (1024x1024)
3. `res/icon.ico` - Windows icon
4. `res/tray-icon.ico` - System tray icon
5. SVG logos in `res/` directory

**After Replacing Source Icons, Run:**
```bash
cd flutter
flutter pub run flutter_launcher_icons
```

This will automatically generate all platform-specific icon variants.

### Building the Application

**Desktop Build:**
```bash
python3 build.py --flutter --release
```

**Android Build:**
```bash
cd flutter
flutter build apk --release
# or for app bundle:
flutter build appbundle --release
```

**iOS Build:**
```bash
cd flutter
flutter build ios --release
```

## 📝 IMPORTANT NOTES

### What Was Changed
- Application display name and metadata
- User-facing branding text
- Temporary password generation logic
- Service and permission dialog text

### What Was Preserved
- Executable names (still "rustdesk" for compatibility)
- Internal code references
- Package identifiers
- Technical comments and documentation
- Protocol identifiers

This approach ensures the application is properly branded while maintaining technical compatibility and ease of maintenance.

## 🔐 SECURITY NOTE

The temporary password has been set to a fixed value: `&aqw1AQW`

**Important Security Considerations:**
1. This password is now **public** and **hardcoded** in the application
2. Users should be informed to change this immediately after installation
3. Consider implementing a setup wizard that forces password change on first use
4. This is suitable for internal deployments where you control distribution

If higher security is needed, consider:
- Implementing a password change requirement on first connection
- Adding documentation that warns users about the default password
- Creating a custom installation script that generates unique passwords per installation

## 📧 Contact

For questions about this customization:
- Website: https://technic-informatique.fr
- Email: contact@technic-informatique.fr

---

**Customization completed on:** 2025-11-08
**Repository:** julien-quad/rustdesk
**Branch:** copilot/customize-rustdesk-for-technic-informatique
