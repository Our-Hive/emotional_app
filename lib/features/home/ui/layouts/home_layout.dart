import 'package:diary_emotional_frontend/features/home/ui/widgets/app_bottom_navbar.dart';
import 'package:flutter/material.dart';

class HoneLayout extends StatelessWidget {
  final Widget childView;
  const HoneLayout({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: const AppBottomNavbar(),
    );
  }
}
