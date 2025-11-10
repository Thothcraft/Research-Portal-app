import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thothresearch_app/features/auth/domain/user.dart';
import 'package:thothresearch_app/core/constants/app_constants.dart';

// Auth state provider
final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState()) {
    _loadAuthState();
  }

  Future<void> _loadAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(AppConstants.authTokenKey);
    final userJson = prefs.getString(AppConstants.userDataKey);
    
    if (token != null && userJson != null) {
      // TODO: Parse user from JSON
      state = state.copyWith(
        token: token,
        isAuthenticated: true,
      );
    }
  }

  Future<void> login(String username, String password) async {
    state = state.copyWith(isLoading: true, error: null);
    
    try {
      // TODO: Call API
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      
      final token = 'mock_token_$username';
      final user = User(username: username);
      
      // Save to preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(AppConstants.authTokenKey, token);
      
      state = state.copyWith(
        user: user,
        token: token,
        isAuthenticated: true,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.authTokenKey);
    await prefs.remove(AppConstants.userDataKey);
    
    state = const AuthState();
  }
}
