import 'package:diary_emotional_frontend/config/app_theme.dart';
import 'package:diary_emotional_frontend/features/account/auth/ui/screen/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: AppTheme.dark(),
      home: const LoginScreen(),
    );
  }
}
