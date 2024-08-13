import 'package:drivelog/pages/car_model_selection.dart';
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
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color.fromRGBO(42, 45, 52, 1),
        colorSchemeSeed: Colors.blue,
        dividerColor: const Color.fromRGBO(64, 68, 79, 1)
      ),
      //home: const RootPage(),
      home: CarModelSelection(),
    );
  }
}


