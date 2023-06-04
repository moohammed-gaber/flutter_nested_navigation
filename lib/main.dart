
import 'package:flutter/material.dart';
import 'package:nested_navigation/navigation.dart';
import 'package:nested_navigation/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: materialNavigationKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NestedNavigationPage(),
    );
  }
}

