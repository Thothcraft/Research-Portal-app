# Changelog

All notable changes to the ThothCraft Research mobile app will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned Features
- Push notifications for device alerts
- Biometric authentication (fingerprint/Face ID)
- Advanced offline sync with conflict resolution
- Home screen widgets
- Apple Watch / Wear OS companion apps
- Multi-language support (Spanish, French, German)
- Export data to CSV/PDF
- Custom dashboard layouts

## [1.0.0] - 2024-11-10

### Added
- Initial release of ThothCraft Research mobile app
- User authentication with token-based security
- Device management and monitoring
- Real-time sensor data visualization
- AI chat assistant integration
- Data file management (view, download, share)
- ML training job monitoring
- User settings and preferences
- Offline support with local caching
- Light and dark theme support
- Clean architecture implementation
- Comprehensive test coverage
- CI/CD pipeline with GitHub Actions

### Features by Module

#### Authentication
- Email/password login
- Token refresh mechanism
- Offline session management
- Secure token storage

#### Devices
- List all connected IoT devices
- View device details and status
- Real-time sensor data updates
- Historical data charts
- Device filtering and search

#### AI Chat
- Conversational AI assistant
- Message history
- Offline message queue
- Context-aware responses

#### Data Files
- Browse uploaded files
- Download files to device
- Share files with other apps
- File preview support
- Search and filter

#### Training
- View ML training jobs
- Monitor training progress
- Start new training sessions
- Federated learning support
- Model management

#### Settings
- Theme toggle (light/dark/system)
- Notification preferences
- Account management
- About and version info
- Privacy settings

### Technical

#### Architecture
- Clean Architecture pattern
- Feature-based module organization
- Separation of concerns (presentation, application, domain, infrastructure)

#### State Management
- Riverpod 2.x for reactive state
- Provider pattern for dependency injection
- Immutable state with freezed

#### Navigation
- go_router for declarative routing
- Deep linking support
- Navigation guards for auth

#### Network
- Dio HTTP client with interceptors
- Automatic token refresh
- Request/response logging
- Error handling and retry logic

#### Storage
- shared_preferences for simple data
- sqflite for structured data
- Secure storage for sensitive data

#### UI/UX
- Material Design 3
- Responsive layouts
- Custom theme system
- Glassmorphism design elements
- Smooth animations and transitions

#### Testing
- Unit tests for business logic
- Widget tests for UI components
- Integration tests for flows
- 80%+ code coverage

#### CI/CD
- Automated testing on PR
- Lint and format checks
- Build verification
- GitHub Actions workflows

### Dependencies
- flutter: ^3.2.0
- dart: ^3.0.0
- riverpod: ^2.5.1
- go_router: ^14.2.7
- dio: ^5.7.0
- freezed: ^2.5.7
- json_serializable: ^6.8.0
- shared_preferences: ^2.3.2
- sqflite: ^2.3.3+1
- fl_chart: ^0.69.0
- flutter_dotenv: ^5.1.0
- file_picker: ^8.1.2
- share_plus: ^10.0.2

## [0.9.0] - 2024-10-15

### Added
- Beta release for internal testing
- Core feature implementation
- Basic UI/UX design

### Changed
- Migrated from GetX to Riverpod
- Redesigned navigation structure
- Improved theme consistency

### Fixed
- Authentication flow bugs
- Data refresh issues
- Memory leaks in chart widgets

## [0.8.0] - 2024-09-20

### Added
- Alpha release
- Proof of concept features
- Basic API integration

---

## Version History

- **1.0.0** (2024-11-10): Production release
- **0.9.0** (2024-10-15): Beta release
- **0.8.0** (2024-09-20): Alpha release

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on submitting changes.

## License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.
