class ApiConstants {
  ApiConstants._();

  // Base URLs - will be loaded from .env
  static String get baseUrl => const String.fromEnvironment(
        'API_BASE_URL',
        defaultValue: 'https://web-production-d7d37.up.railway.app',
      );

  static String get wsUrl => const String.fromEnvironment(
        'WS_URL',
        defaultValue: 'wss://web-production-d7d37.up.railway.app',
      );

  // API Endpoints
  
  // Authentication
  static const String login = '/token';
  static const String register = '/register';
  static const String profile = '/profile';
  
  // Devices
  static const String deviceList = '/device/list';
  static const String deviceRegister = '/device/register';
  static String deviceById(String id) => '/device/$id';
  static String deviceStatus(String id) => '/device/$id/status';
  static const String deviceHeartbeat = '/device/heartbeat';
  
  // Sensors
  static const String sensorsCurrent = '/sensors/current';
  static const String sensorsHistory = '/sensors/history';
  static const String sensorsControl = '/sensors/control';
  static const String sensorsStats = '/sensors/stats';
  
  // Network
  static const String networkWifi = '/network/wifi';
  static const String networkStatus = '/network/status';
  static const String networkScan = '/network/scan';
  
  // Training
  static const String trainingSetup = '/training/training/setup';
  static const String trainingStatus = '/training/training/status';
  static String trainingControl(String jobId) => '/training/training/$jobId/control';
  static const String trainingModels = '/training/training/models';
  
  // Federated Learning
  static const String federatedTrain = '/training/federated/train';
  static const String federatedStatus = '/training/federated/status';
  static String federatedJoin(String sessionId) => '/training/federated/$sessionId/join';
  
  // Files & Data
  static const String upload = '/upload';
  static String download(String fileId) => '/download/$fileId';
  static const String query = '/query';
  static const String fileList = '/file/list';
  static const String fileSync = '/file/sync';
  
  // Health
  static const String health = '/health';
  
  // Request timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);
  
  // Headers
  static const String authHeader = 'Authorization';
  static const String bearerPrefix = 'Bearer';
  static const String contentType = 'Content-Type';
  static const String accept = 'Accept';
  static const String applicationJson = 'application/json';
}
