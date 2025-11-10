# ThothCraft Flutter App - Setup & Run Guide

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

### Required Software

1. **Flutter SDK** (version 3.2.0 or higher)
   - Download from: https://docs.flutter.dev/get-started/install
   - Verify installation: `flutter --version`

2. **Dart SDK** (comes with Flutter)
   - Verify: `dart --version`

3. **Git**
   - Download from: https://git-scm.com/downloads

### Platform-Specific Requirements

#### For Android Development:
- **Android Studio** (latest stable)
- **Android SDK** (API level 21 or higher)
- **Android Emulator** or physical device with USB debugging enabled

#### For iOS Development (macOS only):
- **Xcode** (latest stable)
- **CocoaPods**: `sudo gem install cocoapods`
- **iOS Simulator** or physical iOS device

---

## 🚀 Quick Start (5 Minutes)

### Step 1: Install Dependencies

```bash
cd thothresearch-app
flutter pub get
```

### Step 2: Configure Environment

```bash
# Copy the example environment file
copy .env.example .env

# Edit .env with your API endpoint (optional, defaults work)
```

### Step 3: Generate Code

This generates the Freezed and JSON serialization code:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Step 4: Run the App

```bash
# List available devices
flutter devices

# Run on your device
flutter run

# Or specify a device
flutter run -d <device-id>
```

---

## 🔧 Detailed Setup Instructions

### 1. Clone the Repository

```bash
git clone <repository-url>
cd thothresearch/thothresearch-app
```

### 2. Verify Flutter Installation

```bash
flutter doctor
```

Fix any issues reported by `flutter doctor` before continuing.

### 3. Install Dependencies

```bash
flutter pub get
```

This downloads all packages listed in `pubspec.yaml`.

### 4. Environment Configuration

#### Using .env File (Recommended)

```bash
copy .env.example .env
```

Edit `.env`:

```env
API_BASE_URL=https://web-production-d7d37.up.railway.app
WS_URL=wss://web-production-d7d37.up.railway.app
ENVIRONMENT=development
DEBUG_MODE=true
```

#### Using --dart-define (Alternative)

You can override environment variables at runtime:

```bash
flutter run --dart-define=API_BASE_URL=https://your-api.com --dart-define=DEBUG_MODE=false
```

### 5. Code Generation

Generate Freezed and JSON serialization code:

```bash
# One-time generation
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-regenerates on file changes)
flutter pub run build_runner watch --delete-conflicting-outputs
```

### 6. Run the App

#### Debug Mode

```bash
# Default device
flutter run

# Specific device
flutter run -d <device-id>

# Hot reload: Press 'r' in terminal
# Hot restart: Press 'R' in terminal
# Quit: Press 'q' in terminal
```

#### Release Mode

```bash
flutter run --release
```

---

## 📱 Platform-Specific Setup

### Android Setup

1. **Open Android Studio**
   - File → Settings → Appearance & Behavior → System Settings → Android SDK
   - Ensure Android SDK is installed

2. **Create an Emulator**
   - Tools → Device Manager → Create Device
   - Choose a device (e.g., Pixel 5)
   - Download a system image (API 33+ recommended)

3. **Run on Emulator**
   ```bash
   # Start emulator
   flutter emulators --launch <emulator_id>
   
   # Run app
   flutter run
   ```

4. **Run on Physical Device**
   - Enable Developer Options on your Android device
   - Enable USB Debugging
   - Connect via USB
   ```bash
   flutter devices
   flutter run -d <device-id>
   ```

### iOS Setup (macOS Only)

1. **Install Xcode**
   - Download from Mac App Store
   - Open Xcode and accept license
   ```bash
   sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
   sudo xcodebuild -runFirstLaunch
   ```

2. **Install CocoaPods**
   ```bash
   sudo gem install cocoapods
   cd ios
   pod install
   cd ..
   ```

3. **Run on Simulator**
   ```bash
   # List simulators
   flutter emulators
   
   # Launch simulator
   open -a Simulator
   
   # Run app
   flutter run
   ```

4. **Run on Physical Device**
   - Connect iPhone via USB
   - Trust the computer on your iPhone
   - In Xcode, select your development team:
     - Open `ios/Runner.xcworkspace`
     - Select Runner → Signing & Capabilities
     - Choose your team
   ```bash
   flutter run
   ```

---

## 🏗️ Build for Production

### Android

#### Debug APK
```bash
flutter build apk --debug
```
Output: `build/app/outputs/flutter-apk/app-debug.apk`

#### Release APK
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

#### App Bundle (for Google Play)
```bash
flutter build appbundle --release
```
Output: `build/app/outputs/bundle/release/app-release.aab`

### iOS

#### Debug Build
```bash
flutter build ios --debug
```

#### Release Build
```bash
flutter build ios --release --no-codesign
```

#### For App Store Submission
1. Open `ios/Runner.xcworkspace` in Xcode
2. Select "Any iOS Device" as destination
3. Product → Archive
4. Follow Xcode's distribution wizard

---

## 🧪 Testing

### Run All Tests
```bash
flutter test
```

### Run with Coverage
```bash
flutter test --coverage
```

### Run Specific Test
```bash
flutter test test/features/auth/auth_provider_test.dart
```

### View Coverage Report
```bash
# Install lcov (Linux/Mac)
brew install lcov  # Mac
sudo apt-get install lcov  # Linux

# Generate HTML report
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

---

## 🛠️ Development Workflow

### Hot Reload (Recommended)
```bash
flutter run
# Make code changes
# Press 'r' in terminal to hot reload
```

### Code Generation (Freezed/JSON)
```bash
# Watch mode (recommended during development)
flutter pub run build_runner watch --delete-conflicting-outputs
```

### Linting
```bash
flutter analyze
```

### Format Code
```bash
flutter format lib/
```

---

## 🐛 Troubleshooting

### Issue: "Target of URI doesn't exist" errors

**Solution**: Run code generation
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue: Gradle build fails (Android)

**Solution**: 
```bash
cd android
./gradlew clean
cd ..
flutter clean
flutter pub get
```

### Issue: CocoaPods errors (iOS)

**Solution**:
```bash
cd ios
rm -rf Pods Podfile.lock
pod install --repo-update
cd ..
flutter clean
flutter pub get
```

### Issue: App won't install on device

**Solution**:
```bash
# Android
adb uninstall com.thothcraft.research

# Then try again
flutter run
```

### Issue: .env file not loading

**Solution**: Ensure `.env` is in the root directory and listed in `pubspec.yaml` under `assets`.

---

## 📝 Common Commands Reference

| Command | Description |
|---------|-------------|
| `flutter doctor` | Check Flutter installation |
| `flutter pub get` | Install dependencies |
| `flutter pub upgrade` | Upgrade dependencies |
| `flutter pub outdated` | Check for outdated packages |
| `flutter clean` | Clean build artifacts |
| `flutter run` | Run app in debug mode |
| `flutter run --release` | Run app in release mode |
| `flutter build apk` | Build Android APK |
| `flutter build ios` | Build iOS app |
| `flutter test` | Run unit tests |
| `flutter analyze` | Analyze code for issues |
| `flutter format lib/` | Format all Dart code |

---

## 🔐 API Configuration

### Default API Endpoint

The app connects to:
```
https://web-production-d7d37.up.railway.app
```

### Changing the API Endpoint

1. **Using .env** (recommended):
   ```env
   API_BASE_URL=https://your-api.com
   ```

2. **Using --dart-define**:
   ```bash
   flutter run --dart-define=API_BASE_URL=https://your-api.com
   ```

3. **Hardcode in code** (not recommended):
   Edit `lib/core/constants/api_constants.dart`

---

## 📞 Support

### Getting Help

- **Documentation**: See `README.md` and `MIGRATION_NOTES.md`
- **Issues**: Create a GitHub issue
- **Flutter Docs**: https://docs.flutter.dev/

### Useful Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [Riverpod Documentation](https://riverpod.dev/)
- [go_router Guide](https://pub.dev/packages/go_router)
- [Freezed Guide](https://pub.dev/packages/freezed)

---

## ✅ Checklist

Before running the app, make sure:

- [ ] Flutter SDK installed (`flutter --version`)
- [ ] Android Studio or Xcode installed
- [ ] Dependencies installed (`flutter pub get`)
- [ ] Code generated (`flutter pub run build_runner build`)
- [ ] `.env` file configured
- [ ] Device/emulator ready (`flutter devices`)
- [ ] No errors in `flutter doctor`

---

**Ready to go! Run `flutter run` and start developing! 🚀**
