import 'package:drivelog/pages/home.dart';
import 'package:drivelog/pages/root.dart';
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
      title: 'DriveLog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
            accentColor: Colors.orange,
            cardColor: Colors.yellow,
            backgroundColor: const Color.fromRGBO(42, 45, 52, 1),
            errorColor: Colors.red,
            brightness: Brightness.dark,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      home: const RootPage(),
    );
  }
}


