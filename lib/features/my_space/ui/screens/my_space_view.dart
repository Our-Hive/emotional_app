import 'package:flutter/material.dart';

class MySpaceView extends StatelessWidget {
  static const name = 'ProfileView';

  const MySpaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Space'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('My Space'),
          ],
        ),
      ),
    );
  }
}
