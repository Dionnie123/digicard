import 'package:example/foo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reactive Links Picker Demo',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
            isDense: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            filled: true),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Foo(),
    );
  }
}
