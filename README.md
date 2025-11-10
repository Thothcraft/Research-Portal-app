# ThothCraft Research - Flutter Mobile App

A production-ready Flutter mobile application for IoT device management and AI research, providing feature parity with the web platform.

![Flutter](https://img.shields.io/badge/Flutter-3.2+-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0+-blue?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)

## 📱 Features

- **Authentication**: Secure login with token-based authentication and offline support
- **Device Management**: Real-time device monitoring, sensor data visualization with charts
- **AI Chat**: Conversational AI assistant with message history and offline queue
- **Data Management**: File explorer with download, preview, and share capabilities  
- **ML Training**: Monitor training jobs, manage models, support for federated learning
- **Settings**: User preferences, theme toggle (light/dark), notifications
- **Offline Support**: Local caching with automatic sync when connection restores

## 🏗️ Architecture

This app follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── main.dart                   # App entry point
├── app.dart                    # MaterialApp configuration
├── core/                       # Shared utilities
│   ├── theme/                  # App themes (light/dark)
│   ├── constants/              # API & app constants
│   ├── network/                # Dio HTTP client
│   └── utils/                  # Helpers & validators
├── routes/                     # go_router configuration
└── features/                   # Feature modules
    ├── auth/
    │   ├── presentation/       # UI (screens & widgets)
    │   ├── application/        # State (Riverpod providers)
    │   ├── domain/             # Models
    │   └── infrastructure/     # Repositories & services
    ├── devices/
    ├── chat/
    ├── training/
    └── ...
```

### Technology Stack

- **State Management**: Riverpod 2.x
- **Routing**: go_router with navigation guards
- **HTTP Client**: Dio with interceptors
- **JSON Serialization**: freezed + json_serializable
- **Local Storage**: shared_preferences + sqflite
- **Charts**: fl_chart
- **File Handling**: file_picker, share_plus, open_filex

## 🚀 Getting Started

### Prerequisites

- Flutter SDK >= 3.2.0
- Dart SDK >= 3.0.0
- Android Studio / Xcode (for respective platform development)
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd thothresearch-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Setup environment variables**
   ```bash
   cp .env.example .env
   ```
   
   Edit `.env` and configure your API endpoint:
   ```env
   API_BASE_URL=https://web-production-d7d37.up.railway.app
   WS_URL=wss://web-production-d7d37.up.railway.app
   ENVIRONMENT=development
   DEBUG_MODE=true
   ```

4. **Generate code (freezed, json_serializable)**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

5. **Run the app**
   ```bash
   # For development
   flutter run

   # For specific device
   flutter run -d <device-id>

   # For release build (Android)
   flutter build apk --release
   
   # For release build (iOS)
   flutter build ios --release
   ```

### Using --dart-define for Configuration

You can override environment variables at runtime:

```bash
flutter run --dart-define=API_BASE_URL=https://your-api.com --dart-define=DEBUG_MODE=false
```

## 📦 Project Structure

```
thothresearch-app/
├── lib/
│   ├── main.dart
│   ├── app.dart
│   ├── core/
│   │   ├── theme/
│   │   │   ├── app_theme.dart
│   │   │   ├── app_colors.dart
│   │   │   └── app_text_styles.dart
│   │   ├── constants/
│   │   │   ├── api_constants.dart
│   │   │   └── app_constants.dart
│   │   ├── network/
│   │   │   └── dio_client.dart
│   │   └── utils/
│   ├── routes/
│   │   └── app_router.dart
│   └── features/
│       ├── splash/
│       ├── landing/
│       ├── auth/
│       ├── home/
│       ├── chat/
│       ├── devices/
│       ├── data/
│       ├── training/
│       └── settings/
├── assets/
│   ├── images/
│   ├── icons/
│   └── logos/
├── test/
├── .env
├── .env.example
├── pubspec.yaml
└── README.md
```

## 🧪 Testing

### Run all tests
```bash
flutter test
```

### Run with coverage
```bash
flutter test --coverage
```

### Run specific test file
```bash
flutter test test/features/auth/auth_provider_test.dart
```

## 🔧 Build & Deployment

### Android

1. **Debug APK**
   ```bash
   flutter build apk --debug
   ```

2. **Release APK**
   ```bash
   flutter build apk --release
   ```

3. **App Bundle (for Play Store)**
   ```bash
   flutter build appbundle --release
   ```

### iOS

1. **Debug Build**
   ```bash
   flutter build ios --debug
   ```

2. **Release Build**
   ```bash
   flutter build ios --release
   ```

3. **Archive (for App Store)**
   - Open `ios/Runner.xcworkspace` in Xcode
   - Select "Any iOS Device" as destination
   - Product → Archive

### Configuration

**Android**: Edit `android/app/build.gradle`
- Application ID
- Version name/code
- Min SDK version

**iOS**: Edit `ios/Runner/Info.plist`
- Bundle identifier
- Display name
- Permissions (camera, location, etc.)

## 🎨 Theming

The app supports light and dark themes matching the website design:

- **Primary Color**: Indigo/Blue (#4F46E5)
- **Secondary Color**: Purple (#A855F7)
- **Accent**: Pink (#F472B6)

Toggle theme in Settings or use system default.

## 🌐 Localization

Currently supports English (en_US). To add more languages:

1. Add translations in `lib/l10n/`
2. Update `pubspec.yaml` 
3. Run `flutter gen-l10n`

## 📝 API Integration

The app integrates with the ThothCraft Research backend:

**Base URL**: `https://web-production-d7d37.up.railway.app`

### Key Endpoints

- `POST /token` - Login
- `GET /device/list` - Get devices
- `GET /sensors/current` - Current sensor data
- `POST /training/training/setup` - Start training
- `POST /query` - AI chat

See `MIGRATION_NOTES.md` for complete API documentation.

## 🐛 Troubleshooting

### Build issues
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Dependency conflicts
```bash
flutter pub upgrade
flutter pub outdated
```

### iOS-specific issues
```bash
cd ios
pod install --repo-update
cd ..
```

## 📄 License

This project is licensed under the MIT License - see LICENSE file for details.

## 👥 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## 📞 Support

For issues and questions:
- Create an issue on GitHub
- Contact: support@thothcraft.com

## 🗺️ Roadmap

- [ ] Push notifications
- [ ] Biometric authentication
- [ ] Advanced offline sync
- [ ] Widget support
- [ ] Apple Watch / Wear OS apps
- [ ] Multi-language support
