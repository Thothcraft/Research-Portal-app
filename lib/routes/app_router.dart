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
import 'package:thothresearch_app/features/settings/presentation/settings_screen.dart';

// Main router provider
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);
  
  return GoRouter(
    initialLocation: AppConstants.splashRoute,
    debugLogDiagnostics: true,
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
    routes: [
      // Splash screen
      GoRoute(
        path: AppConstants.splashRoute,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),

      // Landing page
      GoRoute(
        path: AppConstants.landingRoute,
        name: 'landing',
        builder: (context, state) => const LandingScreen(),
      ),

      // Auth page
      GoRoute(
        path: AppConstants.authRoute,
        name: 'auth',
        builder: (context, state) => const LoginScreen(),
      ),

      // Home page with bottom navigation
      GoRoute(
        path: AppConstants.homeRoute,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),

      // Chat page
      GoRoute(
        path: AppConstants.chatRoute,
        name: 'chat',
        builder: (context, state) => const ChatScreen(),
      ),

      // Devices page
      GoRoute(
        path: AppConstants.devicesRoute,
        name: 'devices',
        builder: (context, state) => const DevicesScreen(),
        routes: [
          // Device detail page
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

      // Data files page
      GoRoute(
        path: AppConstants.dataRoute,
        name: 'data',
        builder: (context, state) => const DataFilesScreen(),
      ),

      // Training page
      GoRoute(
        path: AppConstants.trainingRoute,
        name: 'training',
        builder: (context, state) => const TrainingScreen(),
      ),

      // Settings page
      GoRoute(
        path: AppConstants.settingsRoute,
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
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
