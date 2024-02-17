import 'package:diary_emotional_frontend/config/app_theme.dart';
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have sdasdsadapushed the button this many times:',
              ),
              Placeholder(
                fallbackHeight: 100,
                fallbackWidth: 100,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(height: 10),
              FilledButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        const Size(double.infinity, 50)),
                  ),
                  onPressed: () {
                    print('object');
                  },
                  child: Text('data')),
              SizedBox(height: 10),
              FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: colors.error,
                    foregroundColor: colors.onError,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    print('object');
                  },
                  child: Text('data')),
              SizedBox(height: 10),
              FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: colors.tertiary,
                    foregroundColor: colors.onTertiary,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    print('object');
                  },
                  child: Text('data')),
              SizedBox(height: 10),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
