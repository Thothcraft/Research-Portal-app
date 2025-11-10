import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thothresearch_app/core/theme/app_theme.dart';
import 'package:thothresearch_app/routes/app_router.dart';

class ThothResearchApp extends ConsumerWidget {
  const ThothResearchApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'ThothCraft Research',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
      locale: const Locale('en', 'US'),
    );
  }
}
