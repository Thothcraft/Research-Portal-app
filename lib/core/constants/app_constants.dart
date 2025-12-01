class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'ThothCraft Research';
  static const String appTagline = 'IoT Device Management and AI Research Platform';
  
  // Storage Keys
  static const String authTokenKey = 'auth_token';
  static const String userDataKey = 'user_data';
  static const String userSettingsKey = 'user_settings';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language';
  
  // Cache Keys
  static const String devicesCache = 'devices_cache';
  static const String chatMessagesCache = 'chat_messages_cache';
  static const String trainingJobsCache = 'training_jobs_cache';
  
  // Timeouts & Intervals
  static const Duration heartbeatInterval = Duration(seconds: 30);
  static const Duration sensorUpdateInterval = Duration(seconds: 1);
  static const Duration cacheExpiry = Duration(hours: 1);
  static const Duration offlineSyncInterval = Duration(minutes: 5);
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxChatMessages = 100;
  
  // Validation
  static const int minUsernameLength = 3;
  static const int minPasswordLength = 6;
  static const int maxFileSize = 100 * 1024 * 1024; // 100MB
  
  // Sensor thresholds
  static const double temperatureMin = -40.0;
  static const double temperatureMax = 85.0;
  static const double humidityMin = 0.0;
  static const double humidityMax = 100.0;
  
  // Chart settings
  static const int maxChartDataPoints = 50;
  static const Duration chartUpdateInterval = Duration(seconds: 1);
  
  // Test accounts (for development)
  static const List<Map<String, String>> testAccounts = [
    {'username': 'researcher1', 'password': 'password123', 'role': 'Researcher'},
    {'username': 'student1', 'password': 'password123', 'role': 'Student'},
    {'username': 'admin', 'password': 'admin123', 'role': 'Admin'},
  ];
  
  // Animation durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Routes (will be used by go_router)
  static const String splashRoute = '/splash';
  static const String landingRoute = '/landing';
  static const String authRoute = '/auth';
  static const String homeRoute = '/home';
  static const String chatRoute = '/chat';
  static const String devicesRoute = '/devices';
  static const String deviceDetailRoute = '/devices/:id';
  static const String dataRoute = '/data';
  static const String trainingRoute = '/training';
  static const String coursesRoute = '/courses';
  static const String settingsRoute = '/settings';
}
