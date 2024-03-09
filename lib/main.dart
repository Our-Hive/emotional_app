import 'package:emotional_app/config/app_environment.dart';
import 'package:emotional_app/config/router/app_router.dart';
import 'package:emotional_app/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await AppEnvironment.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'OurHive - Emotional Diary',
      darkTheme: AppTheme.dark(),
      routerConfig: appRouter,
    );
  }
}
