import 'package:flutter/material.dart';
import 'package:wordle_app/pages/splash.dart';
import 'ui/elements.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemes.projectTheme,
      home: const SplashScreen(),
    );
  }
}
