import 'package:flutter/material.dart';

import 'views/home.dart';

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
      title: 'UClass 5 Demo',
      theme:
          ThemeData(useMaterial3: true, colorSchemeSeed: Colors.purpleAccent),
      home: const HomePage(),
    );
  }
}
