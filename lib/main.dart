import 'package:diary_emotional_frontend/config/app_router.dart';
import 'package:diary_emotional_frontend/config/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      darkTheme: AppTheme.dark(),
      routerConfig: appRouter,
    );
  }
}
