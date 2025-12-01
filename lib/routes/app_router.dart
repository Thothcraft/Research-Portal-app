/// Application routing configuration
/// 
/// This file defines the app's navigation structure using go_router.
/// Includes route definitions, navigation guards, and authentication redirects.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:thothresearch_app/core/constants/app_constants.dart';
import 'package:thothresearch_app/features/auth/application/auth_provider.dart';
import 'package:thothresearch_app/features/splash/presentation/splash_screen.dart';
import 'package:thothresearch_app/features/landing/presentation/landing_screen.dart';
import 'package:thothresearch_app/features/auth/presentation/login_screen.dart';
import 'package:thothresearch_app/features/home/presentation/home_screen.dart';
import 'package:thothresearch_app/features/chat/presentation/chat_screen.dart';
import 'package:thothresearch_app/features/devices/presentation/devices_screen.dart';
import 'package:thothresearch_app/features/devices/presentation/device_detail_screen.dart';
import 'package:thothresearch_app/features/data/presentation/data_files_screen.dart';
import 'package:thothresearch_app/features/training/presentation/training_screen.dart';
import 'package:thothresearch_app/features/courses/presentation/courses_screen.dart';
import 'package:thothresearch_app/features/community/presentation/community_screen.dart';
import 'package:thothresearch_app/features/settings/presentation/settings_screen.dart';

/// Main router provider
/// 
/// Provides the GoRouter instance with authentication-aware navigation.
/// Watches [authStateProvider] to handle protected routes.
/// Main router provider
/// 
/// Provides the GoRouter instance with authentication-aware navigation.
/// Watches [authStateProvider] to handle protected routes.
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  
  return GoRouter(
    initialLocation: AppConstants.splashRoute,
    debugLogDiagnostics: true,
    
    /// Global navigation guard
    /// 
    /// Handles authentication-based redirects:
    /// - Splash screen: Always allowed
    /// - Unauthenticated users: Redirect to landing page
    /// - Authenticated users: Redirect away from auth/landing pages
    redirect: (context, state) {
      final isAuthenticated = authState.isAuthenticated;
      final isAuthRoute = state.matchedLocation == AppConstants.authRoute;
      final isLandingRoute = state.matchedLocation == AppConstants.landingRoute;
      final isSplashRoute = state.matchedLocation == AppConstants.splashRoute;

      // Allow splash to load
      if (isSplashRoute) return null;

      // If not authenticated and trying to access protected route
      if (!isAuthenticated && !isAuthRoute && !isLandingRoute) {
        return AppConstants.landingRoute;
      }

      // If authenticated and on auth or landing page, redirect to home
      if (isAuthenticated && (isAuthRoute || isLandingRoute)) {
        return AppConstants.homeRoute;
      }

      return null; // No redirect needed
    },
    
    /// Route definitions
    routes: [
      // Splash screen - Initial loading screen
      GoRoute(
        path: AppConstants.splashRoute,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // Landing page - Pre-authentication welcome screen
      GoRoute(
        path: AppConstants.landingRoute,
        name: 'landing',
        builder: (context, state) => const LandingScreen(),
      ),

      // Auth page - Login screen
      GoRoute(
        path: AppConstants.authRoute,
        name: 'auth',
        builder: (context, state) => const LoginScreen(),
      ),

      // Home page - Main dashboard (requires authentication)
      GoRoute(
        path: AppConstants.homeRoute,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),

      // Chat page - AI assistant (requires authentication)
      GoRoute(
        path: AppConstants.chatRoute,
        name: 'chat',
        builder: (context, state) => const ChatScreen(),
      ),

      // Devices page - IoT device list (requires authentication)
      GoRoute(
        path: AppConstants.devicesRoute,
        name: 'devices',
        builder: (context, state) => const DevicesScreen(),
        routes: [
          // Device detail page - Individual device view
          GoRoute(
            path: ':id',
            name: 'device-detail',
            builder: (context, state) {
              final deviceId = state.pathParameters['id']!;
              return DeviceDetailScreen(deviceId: deviceId);
            },
          ),
        ],
      ),

      // Data files page - File management (requires authentication)
      GoRoute(
        path: AppConstants.dataRoute,
        name: 'data',
        builder: (context, state) => const DataFilesScreen(),
      ),

      // Training page - ML model training (requires authentication)
      GoRoute(
        path: AppConstants.trainingRoute,
        name: 'training',
        builder: (context, state) => const TrainingScreen(),
      ),

      // Courses page - Research training courses (requires authentication)
      GoRoute(
        path: AppConstants.coursesRoute,
        name: 'courses',
        builder: (context, state) => const CoursesScreen(),
      ),

      // Community page - Research community forum (requires authentication)
      GoRoute(
        path: AppConstants.communityRoute,
        name: 'community',
        builder: (context, state) => const CommunityScreen(),
      ),

      // Settings page - User preferences (requires authentication)
      GoRoute(
        path: AppConstants.settingsRoute,
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
    
    /// Error page - 404 handler
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Page not found',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => context.go(AppConstants.homeRoute),
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    ),
  );
});
