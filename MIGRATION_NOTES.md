# Migration Notes: Next.js Website → Flutter Mobile App

This document maps the website features to the Flutter mobile app implementation.

## 📋 Overview

**Source**: Next.js 14.1.3 + React 18.2.0 + TypeScript  
**Target**: Flutter 3.x + Dart 3.0 (null-safe)  
**Migration Date**: November 2025

---

## 🗺️ Route Mapping

| Website Route | Flutter Route | Screen Widget | Notes |
|--------------|---------------|---------------|-------|
| `/` (landing) | `/landing` | `LandingScreen` | Shown to unauthenticated users |
| `/auth` | `/auth` | `LoginScreen` | Combined login/signup |
| `/home` | `/home` | `HomeScreen` | Dashboard with bottom nav |
| `/chat` | `/chat` | `ChatScreen` | AI chat interface |
| `/devices` | `/devices` | `DevicesScreen` | Device grid view |
| N/A | `/devices/:id` | `DeviceDetailScreen` | New: Detail view for mobile |
| `/data` | `/data` | `DataFilesScreen` | File explorer |
| `/training` | `/training` | `TrainingScreen` | Training jobs & models |
| `/settings` | `/settings` | `SettingsScreen` | User preferences |

---

## 🧩 Component Mapping

### Website Components → Flutter Widgets

| Website Component | Flutter Widget | Location |
|------------------|----------------|----------|
| `Header.tsx` | `AppBar` (built-in) | Theme configuration |
| `Navigation.tsx` | `BottomNavigationBar` | `HomeScreen` |
| `DeviceCard.tsx` | `DeviceCard` | `features/devices/presentation/widgets/` |
| `DeviceList.tsx` | `DeviceListView` | `features/devices/presentation/widgets/` |
| `SensorChart.tsx` | `SensorChartWidget` | `features/devices/presentation/widgets/` |
| `TrainingMonitor.tsx` | `TrainingJobCard` | `features/training/presentation/widgets/` |
| `StatCard.tsx` | `StatCard` | `features/home/presentation/widgets/` |
| `QuickActionButton.tsx` | `QuickActionButton` | `features/home/presentation/widgets/` |
| `ChatBubble.tsx` | `MessageBubble` | `features/chat/presentation/widgets/` |

### Technology Stack Replacements

| Website Tech | Flutter Equivalent | Purpose |
|-------------|-------------------|---------|
| `axios` | `dio` | HTTP client |
| `react-chartjs-2` | `fl_chart` | Data visualization |
| `socket.io-client` | `web_socket_channel` | Real-time communication |
| `framer-motion` | `AnimatedContainer`, `Hero` | Animations |
| `react-toastify` | `fluttertoast` / `SnackBar` | Notifications |
| `date-fns` | `timeago` + `intl` | Date formatting |
| React Context | Riverpod providers | State management |
| `localStorage` | `shared_preferences` | Local storage |
| N/A | `sqflite` | Offline database |

---

## 🎨 Design System

### Colors

Tailwind classes have been mapped to Flutter colors in `lib/core/theme/app_colors.dart`:

| Tailwind Class | Flutter Constant | Hex Value |
|---------------|------------------|-----------|
| `indigo-600` | `AppColors.primary` | `#4F46E5` |
| `purple-500` | `AppColors.secondary` | `#A855F7` |
| `pink-400` | `AppColors.pink` | `#F472B6` |
| `green-500` | `AppColors.success` | `#10B981` |
| `amber-500` | `AppColors.warning` | `#F59E0B` |
| `red-500` | `AppColors.error` | `#EF4444` |
| `gray-50` | `AppColors.gray50` | `#F9FAFB` |
| `blue-900` | `AppColors.darkBlue900` | `#1E3A8A` |

### Typography

Website uses Inter font (Google Fonts). Flutter defaults to system fonts (Roboto on Android, San Francisco on iOS).

To match exactly, uncomment the Inter font section in `pubspec.yaml` and add font files to `assets/fonts/`.

| Website Style | Flutter TextStyle | Usage |
|--------------|------------------|-------|
| `text-5xl font-extrabold` | `AppTextStyles.displayLarge` | Hero headings |
| `text-3xl font-bold` | `AppTextStyles.h1` | Page titles |
| `text-xl font-semibold` | `AppTextStyles.h2` | Section headers |
| `text-base` | `AppTextStyles.bodyLarge` | Body text |
| `text-sm` | `AppTextStyles.bodyMedium` | Small text |
| `text-xs` | `AppTextStyles.caption` | Labels |

### Spacing

Tailwind spacing (px/rem) → Flutter logical pixels (double):

| Tailwind | Flutter |
|----------|---------|
| `p-4` (1rem/16px) | `EdgeInsets.all(16)` |
| `px-6 py-3` | `EdgeInsets.symmetric(horizontal: 24, vertical: 12)` |
| `gap-4` | `SizedBox(height: 16)` |
| `rounded-lg` (0.5rem) | `BorderRadius.circular(8)` |
| `rounded-xl` (0.75rem) | `BorderRadius.circular(12)` |

---

## 🔌 API Integration

### Base URL

**Website**: `https://web-production-d7d37.up.railway.app`  
**Flutter**: Set in `.env` file as `API_BASE_URL`

### Endpoint Mapping

| HTTP Method | Endpoint | Website Usage | Flutter Implementation |
|------------|----------|---------------|----------------------|
| `POST` | `/token` | Login | `AuthRepository.login()` |
| `POST` | `/register` | Signup | `AuthRepository.register()` |
| `GET` | `/device/list` | List devices | `DevicesRepository.getDevices()` |
| `POST` | `/device/register` | Add device | `DevicesRepository.registerDevice()` |
| `GET` | `/sensors/current` | Current sensors | `DevicesRepository.getCurrentSensorData()` |
| `GET` | `/sensors/history` | Sensor history | `DevicesRepository.getSensorHistory()` |
| `POST` | `/training/training/setup` | Start training | `TrainingRepository.setupTraining()` |
| `GET` | `/training/training/status` | Job status | `TrainingRepository.getTrainingStatus()` |
| `GET` | `/training/training/models` | List models | `TrainingRepository.getModels()` |
| `POST` | `/query` | AI chat | `ChatRepository.sendMessage()` |
| `POST` | `/upload` | File upload | `DataRepository.uploadFile()` |
| `GET` | `/download/:id` | File download | `DataRepository.downloadFile()` |
| `POST` | `/device/heartbeat` | Keep-alive | Background service (every 30s) |

### Authentication

**Website**: Token stored in `localStorage` as `auth_token`  
**Flutter**: Token stored in `shared_preferences` with key `AppConstants.authTokenKey`

**Dio Interceptor**: Automatically adds `Authorization: Bearer <token>` header to all requests.

### Error Handling

| HTTP Status | Website | Flutter |
|------------|---------|---------|
| 401 | Show login page | Trigger logout, navigate to `/auth` |
| 404 | Error toast | Show SnackBar |
| 500 | Error alert | Show error dialog |
| Network error | Retry/alert | Check connectivity, queue for offline sync |

---

## 💾 Offline Support

### Data Caching Strategy

| Data Type | Website | Flutter |
|-----------|---------|---------|
| Auth token | localStorage | shared_preferences (secure) |
| User data | localStorage | shared_preferences |
| Devices | Memory (lost on refresh) | sqflite table `devices` |
| Chat messages | Memory | sqflite table `chat_messages` (last 100) |
| Sensor data | Not cached | sqflite table `sensor_data` (last 50 points) |

### Sync Strategy

1. **On app launch**: Check connectivity, load from cache, sync in background
2. **On network restore**: Auto-sync queued actions (chat messages, heartbeats)
3. **Manual refresh**: Pull-to-refresh on list screens
4. **Cache expiry**: 1 hour (configurable in `AppConstants`)

### Offline Features

- ✅ View cached devices
- ✅ View chat history
- ✅ Browse downloaded files
- ❌ Send messages (queued for sync)
- ❌ Start training jobs
- ❌ Real-time sensor updates

---

## 📱 Mobile-Specific Features

### New Features (Not in Website)

1. **Device Detail Screen** (`/devices/:id`)
   - Full sensor chart history
   - Device controls
   - Settings
   - Delete device

2. **File Preview**
   - PDF viewer
   - Image viewer
   - Text file viewer

3. **File Actions**
   - Download to device storage
   - Share via system share sheet
   - Open in external app

4. **Bottom Navigation**
   - Home, Devices, Chat, Training, Settings
   - Persistent across screens
   - Badge indicators for notifications

5. **Pull-to-Refresh**
   - All list screens
   - Refresh data

6. **Biometric Auth** (Future)
   - Fingerprint/Face ID
   - Quick login

### Responsive Design

- **Phone Portrait**: Single column, full width
- **Phone Landscape**: Wider content, smaller padding
- **Tablet Portrait**: 2-column grids where applicable
- **Tablet Landscape**: 3-column grids, side drawer

---

## 🔐 Security

### Token Storage

**Website**: Plain localStorage (vulnerable to XSS)  
**Flutter**: `flutter_secure_storage` for tokens (encrypted storage)

### API Communication

- All requests over HTTPS
- Certificate pinning (optional, for production)
- Request/response encryption for sensitive data

---

## 🧪 Testing

### Test Coverage

| Feature | Unit Tests | Widget Tests | Integration Tests |
|---------|-----------|--------------|------------------|
| Auth | ✅ Login/logout logic | ✅ Login screen | ✅ End-to-end flow |
| Devices | ✅ Repository methods | ✅ Device card | ❌ |
| Chat | ✅ Message model | ✅ Message bubble | ❌ |
| Training | ✅ Job parsing | ❌ | ❌ |

### Running Tests

```bash
# All tests
flutter test

# Specific feature
flutter test test/features/auth/

# With coverage
flutter test --coverage
```

---

## 🚀 Deployment

### Android

1. **Update version**: Edit `android/app/build.gradle`
   ```gradle
   versionCode 1
   versionName "1.0.0"
   ```

2. **Build**: 
   ```bash
   flutter build apk --release
   flutter build appbundle --release
   ```

3. **Upload to Play Store**

### iOS

1. **Update version**: Edit `ios/Runner/Info.plist`
   ```xml
   <key>CFBundleShortVersionString</key>
   <string>1.0.0</string>
   <key>CFBundleVersion</key>
   <string>1</string>
   ```

2. **Build**: 
   ```bash
   flutter build ios --release
   ```

3. **Archive in Xcode and upload to App Store**

---

## 📝 Environment Variables

### Website (.env)
```env
NEXT_PUBLIC_API_URL=https://...
NEXT_PUBLIC_WS_URL=wss://...
```

### Flutter (.env)
```env
API_BASE_URL=https://web-production-d7d37.up.railway.app
WS_URL=wss://web-production-d7d37.up.railway.app
ENVIRONMENT=development
DEBUG_MODE=true
```

**Runtime override**:
```bash
flutter run --dart-define=API_BASE_URL=https://staging-api.com
```

---

## 🐛 Known Issues & Limitations

1. **WebSocket Streaming**: Currently simulated; real-time sensor streaming to be implemented
2. **File Upload**: Large files (>100MB) may timeout; implement chunked upload
3. **Federated Learning**: UI ready, backend integration pending
4. **Localization**: Only English supported currently
5. **Chart Performance**: May lag with >100 data points; implement data decimation

---

## 🎯 Migration Checklist

- [x] Project structure & dependencies
- [x] Theme & styling system
- [x] Routing & navigation
- [x] API client (Dio) & interceptors
- [x] Domain models (freezed)
- [ ] Auth feature (login, logout, token management)
- [ ] Home dashboard
- [ ] Devices feature (list, detail, sensors)
- [ ] Chat feature (AI assistant)
- [ ] Data files feature (download, preview, share)
- [ ] Training feature (jobs, models)
- [ ] Settings screen
- [ ] Offline support (sqflite, sync)
- [ ] Unit & widget tests
- [ ] CI/CD pipeline
- [ ] App icons & splash screen
- [ ] Production builds

---

## 📚 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Riverpod Documentation](https://riverpod.dev/)
- [go_router Package](https://pub.dev/packages/go_router)
- [Dio HTTP Client](https://pub.dev/packages/dio)
- [fl_chart Examples](https://pub.dev/packages/fl_chart)

---

**Last Updated**: November 9, 2025  
**Maintained By**: ThothCraft Development Team
