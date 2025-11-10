import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:thothresearch_app/core/constants/api_constants.dart';
import 'package:thothresearch_app/core/constants/app_constants.dart';

/// Dio HTTP client provider
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: dotenv.get('API_BASE_URL', fallback: ApiConstants.baseUrl),
      connectTimeout: ApiConstants.connectTimeout,
      receiveTimeout: ApiConstants.receiveTimeout,
      sendTimeout: ApiConstants.sendTimeout,
      headers: {
        ApiConstants.contentType: ApiConstants.applicationJson,
        ApiConstants.accept: ApiConstants.applicationJson,
      },
    ),
  );

  // Add interceptors
  dio.interceptors.addAll([
    // Auth interceptor
    AuthInterceptor(),
    
    // Logging interceptor (only in debug mode)
    if (dotenv.get('DEBUG_MODE', fallback: 'false') == 'true')
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
  ]);

  return dio;
});

/// Auth interceptor to add token to requests
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Get token from shared preferences
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppConstants.authTokenKey);

    if (token != null && token.isNotEmpty) {
      options.headers[ApiConstants.authHeader] = 
          '${ApiConstants.bearerPrefix} $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 Unauthorized - could trigger logout here
    if (err.response?.statusCode == 401) {
      // TODO: Trigger logout or token refresh
      print('Unauthorized: Session expired');
    }

    handler.next(err);
  }
}

/// Provider for SharedPreferences
final sharedPreferencesProvider = Provider<Future<SharedPreferences>>((ref) {
  return SharedPreferences.getInstance();
});
