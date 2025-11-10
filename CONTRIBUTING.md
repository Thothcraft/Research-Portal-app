# Contributing to ThothCraft Research

Thank you for your interest in contributing to ThothCraft Research! This document provides guidelines and instructions for contributing.

## Code of Conduct

By participating in this project, you agree to maintain a respectful and collaborative environment.

## Getting Started

1. **Fork the repository** on GitHub
2. **Clone your fork** locally:
   ```bash
   git clone https://github.com/YOUR_USERNAME/Research-Portal-app.git
   cd Research-Portal-app
   ```
3. **Set up the development environment** following the instructions in `SETUP_GUIDE.md`
4. **Create a feature branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Development Workflow

### Making Changes

1. **Write clean, readable code** following Dart best practices
2. **Follow the existing architecture** (Clean Architecture with Riverpod)
3. **Add comments** for complex logic
4. **Update documentation** when necessary

### Code Style

- Follow the Dart style guide
- Use `flutter format` to format your code:
  ```bash
  flutter format lib/
  ```
- Run the analyzer to check for issues:
  ```bash
  flutter analyze
  ```

### File Organization

```
lib/
├── features/
│   └── [feature_name]/
│       ├── presentation/     # UI layer (screens, widgets)
│       ├── application/      # Business logic (providers, state)
│       ├── domain/           # Models and entities
│       └── infrastructure/   # Data sources, repositories
└── core/                     # Shared utilities, themes, constants
```

### Testing

- **Write tests** for new features
- **Run all tests** before submitting:
  ```bash
  flutter test
  ```
- **Ensure tests pass** and don't break existing functionality

### Commit Messages

Write clear, concise commit messages:

- **Good**: `Add offline support for device list`
- **Good**: `Fix auth token refresh bug`
- **Bad**: `Fix stuff`
- **Bad**: `WIP`

Follow this format:
```
<type>: <subject>

<body>

<footer>
```

Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

Example:
```
feat: Add biometric authentication

Implement fingerprint and face ID authentication for iOS and Android.
Uses local_auth package with fallback to password login.

Closes #123
```

## Submitting Changes

1. **Push your changes** to your fork:
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Create a Pull Request** on GitHub:
   - Go to the original repository
   - Click "New Pull Request"
   - Select your feature branch
   - Fill out the PR template

3. **PR Requirements**:
   - Clear description of changes
   - Reference any related issues
   - All tests passing
   - Code formatted and analyzed
   - Screenshots for UI changes

## Pull Request Review Process

1. A maintainer will review your PR
2. They may request changes or ask questions
3. Make requested changes and push updates
4. Once approved, a maintainer will merge your PR

## Reporting Issues

### Bug Reports

When reporting bugs, include:

- **Description**: Clear description of the bug
- **Steps to reproduce**: Numbered steps to trigger the bug
- **Expected behavior**: What should happen
- **Actual behavior**: What actually happens
- **Environment**: Device, OS version, app version
- **Screenshots**: If applicable
- **Logs**: Error messages or stack traces

### Feature Requests

When requesting features, include:

- **Description**: Clear description of the feature
- **Use case**: Why this feature is needed
- **Mockups**: UI mockups if applicable
- **Examples**: Examples from other apps if applicable

## Development Setup

### Prerequisites

- Flutter SDK >= 3.2.0
- Dart SDK >= 3.0.0
- Git
- IDE: VS Code or Android Studio

### Installation

Follow the detailed setup guide in `SETUP_GUIDE.md`.

### Running the App

```bash
# Install dependencies
flutter pub get

# Generate code (for freezed, json_serializable)
flutter pub run build_runner build --delete-conflicting-outputs

# Run on connected device
flutter run

# Run tests
flutter test

# Build for release
flutter build apk --release  # Android
flutter build ios --release  # iOS
```

## Architecture Guidelines

### Clean Architecture

- **Presentation**: UI components (screens, widgets)
- **Application**: Business logic (providers, state management)
- **Domain**: Core business entities and models
- **Infrastructure**: External dependencies (API, database)

### State Management

- Use **Riverpod** for state management
- Create providers for each feature
- Keep providers focused and single-purpose

### Navigation

- Use **go_router** for navigation
- Define routes in `lib/routes/app_router.dart`
- Use named routes instead of direct navigation

## Questions?

If you have questions:

- Check existing issues and PRs
- Read the documentation
- Ask in GitHub Discussions
- Contact: support@thothcraft.com

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

Thank you for contributing to ThothCraft Research! 🚀
