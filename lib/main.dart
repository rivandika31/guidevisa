import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';

void main() => runApp(const WallpaperApp());

class WallpaperApp extends StatelessWidget {
  const WallpaperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Walpaper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color(0xFF7C4DFF),
        scaffoldBackgroundColor: const Color(0xFF0E0E14),
      ),
      home: const SplashScreen(),
    );
  }
}