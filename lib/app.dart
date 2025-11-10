/// Root application widget
/// 
/// This widget configures the MaterialApp with routing, theming, and
/// localization settings. It uses Riverpod's ConsumerWidget to access
/// the application router state.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thothresearch_app/core/theme/app_theme.dart';
import 'package:thothresearch_app/routes/app_router.dart';

/// The root widget of the ThothCraft Research application
/// 
/// Sets up:
/// - MaterialApp with go_router navigation
/// - Light and dark theme support (system default)
/// - Localization (English US)
/// - Debug banner disabled for production
class ThothResearchApp extends ConsumerWidget {
  const ThothResearchApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the router provider for navigation state
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'ThothCraft Research',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Follows system theme preference
      routerConfig: router,
      locale: const Locale('en', 'US'),
    );
  }
}

