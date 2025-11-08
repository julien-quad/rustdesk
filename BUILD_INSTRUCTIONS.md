# Build Instructions for Technic informatique

This guide provides instructions for building the customized RustDesk application for different platforms.

## Quick Start (macOS)

If you're building on macOS for the first time, follow these steps in order:

```bash
# 1. Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# 2. Verify Rust installation
cargo --version

# 3. Initialize git submodules (CRITICAL!)
git submodule update --init --recursive

# 4. Build the application
python3 build.py --flutter
```

For other platforms or detailed instructions, see sections below.

## Prerequisites

### All Platforms
- **Rust 1.75 or newer** - Install from https://rustup.rs/
  - On macOS/Linux: `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
  - On Windows: Download and run rustup-init.exe
  - After installation, restart your terminal or run: `source $HOME/.cargo/env` (macOS/Linux)
- Git
- Python 3
- vcpkg (for C++ dependencies)

Set the `VCPKG_ROOT` environment variable to your vcpkg installation directory.

### Windows
- Visual Studio 2019 or newer with C++ build tools
- Windows SDK

### macOS
- Xcode Command Line Tools: `xcode-select --install`
- macOS 10.14 or newer
- Homebrew (recommended): `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

## Building

**IMPORTANT: Before building on any platform, initialize git submodules:**
```bash
git submodule update --init --recursive
```

This step is required as RustDesk uses submodules for core libraries like `hbb_common`.

### Windows x64

```bash
# Build with Flutter (builds in release mode by default)
python3 build.py --flutter

# Or for Rust-only build
cargo build --release --features flutter
```

The executable will be located at:
- `target/release/rustdesk.exe` (Rust binary)
- Flutter build output in `flutter/build/windows/runner/Release/`

### Windows ARM64

```bash
# Install ARM64 target (first time only)
rustup target add aarch64-pc-windows-msvc

# Build for ARM64
cargo build --release --target aarch64-pc-windows-msvc --features flutter
```

Note: Cross-compilation for ARM64 on x64 Windows may require additional setup for C++ dependencies.

### macOS

**Prerequisites for macOS:**
1. Install Rust if not already installed:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   source $HOME/.cargo/env
   ```

2. Install Xcode Command Line Tools if not already installed:
   ```bash
   xcode-select --install
   ```

3. Verify installations:
   ```bash
   cargo --version  # Should show cargo 1.75 or newer
   rustc --version  # Should show rustc 1.75 or newer
   ```

4. **Initialize git submodules (IMPORTANT):**
   ```bash
   git submodule update --init --recursive
   ```
   This step is crucial as RustDesk uses submodules for core libraries.

**Build commands:**
```bash
# Build for macOS (builds in release mode by default)
python3 build.py --flutter

# Or for specific architecture using cargo directly
cargo build --release --features flutter
```

The app bundle will be in `flutter/build/macos/Build/Products/Release/`

For universal binary (x86_64 + ARM64):
```bash
# Build for both architectures
cargo build --release --target x86_64-apple-darwin --features flutter
cargo build --release --target aarch64-apple-darwin --features flutter

# Create universal binary with lipo
lipo -create \
  target/x86_64-apple-darwin/release/rustdesk \
  target/aarch64-apple-darwin/release/rustdesk \
  -output rustdesk-universal
```

## Build Options

### build.py Options

- `--flutter` - Build with Flutter UI (recommended)
- `--hwcodec` - Enable hardware video codec support
- `--portable` - Build Windows portable version
- `--skip-cargo` - Skip cargo build process (Flutter only, Linux only)

**Note:** build.py builds in release mode by default. There is no `--release` flag.

### Examples

**Flutter build with hardware codec:**
```bash
python3 build.py --flutter --hwcodec
```

**Cargo direct build with release mode:**
```bash
cargo build --release --features flutter
```

## After Building

1. **Test the application** to ensure branding and password are correct
2. **Replace icons** as documented in BRANDING_CUSTOMIZATION.md
3. **Package for distribution**

## Platform-Specific Notes

### Windows
- The build requires C++ dependencies (libvpx, libyuv, opus, aom) via vcpkg
- Hardware codec support requires additional Windows SDK components

### macOS
- App must be signed for distribution
- Notarization required for distribution outside Mac App Store
- Set proper bundle identifier: `fr.technic-informatique.assistance`

## Troubleshooting

### "failed to read `.../libs/hbb_common/Cargo.toml`" error
This error occurs when git submodules haven't been initialized.

**Solution:**
```bash
git submodule update --init --recursive
```

This must be done before building. The error message will look like:
```
failed to load manifest for dependency `hbb_common`
Caused by: failed to read `/path/to/libs/hbb_common/Cargo.toml`
Caused by: No such file or directory (os error 2)
```

### "cargo: command not found" error
This means Rust is not installed or not in your PATH.

**Solution:**
1. Install Rust:
   ```bash
   curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
   ```
2. Add cargo to your PATH (restart terminal or run):
   ```bash
   source $HOME/.cargo/env
   ```
3. Verify installation:
   ```bash
   cargo --version
   ```

### "unrecognized arguments: --release" with build.py
The `build.py` script does not accept `--release` flag. It builds in release mode by default.

**Solution:**
Use `python3 build.py --flutter` instead of `python3 build.py --flutter --release`

### vcpkg errors
Ensure `VCPKG_ROOT` is set and dependencies are installed:
```bash
vcpkg install libvpx libyuv opus aom
```

### Rust toolchain issues
Update Rust to the minimum required version:
```bash
rustup update
rustc --version  # Should be 1.75 or newer
```

### Other submodule issues
If you encounter other submodule errors:
```bash
git submodule update --init --recursive
```

### Build script errors
Ensure Python 3 is installed and in PATH:
```bash
python3 --version
```

## Distribution

### Windows
Create an installer using:
- NSIS installer: See `res/msi/` directory
- MSI installer: Windows Installer XML (WiX) toolset

### macOS
Create a DMG for distribution:
```bash
# After building, create DMG
hdiutil create -volname "Assistance Technic informatique" \
  -srcfolder flutter/build/macos/Build/Products/Release/Assistance\ Technic\ informatique.app \
  -ov -format UDZO AssistanceTechnicInformatique.dmg
```

## Verification

After building, verify:

1. **Application name** appears as "Assistance Technic informatique"
2. **Default permanent password** is `&aqw1AQW` (check in Security settings)
3. **Branding** shows "Technic informatique" in UI strings
4. **Icons** are replaced (if you've followed BRANDING_CUSTOMIZATION.md)

## Support

For build issues specific to this customization:
- Website: https://technic-informatique.fr
- Email: contact@technic-informatique.fr

For general RustDesk build issues:
- Original project: https://github.com/rustdesk/rustdesk
- Documentation: https://rustdesk.com/docs/
