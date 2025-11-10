/// ThothCraft Research - Flutter Mobile App
/// 
/// Main entry point for the application.
/// This file initializes the Flutter app with Riverpod state management
/// and loads environment configuration.
/// 
/// Author: ThothCraft Team
/// Created: 2024

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:thothresearch_app/app.dart';

/// Application entry point
/// 
/// Initializes Flutter bindings, loads environment variables from .env file,
/// and wraps the app with [ProviderScope] to enable Riverpod state management.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment variables from .env file
  await dotenv.load(fileName: ".env");
  
  runApp(
    const ProviderScope(
      child: ThothResearchApp(),
    ),
  );
}

