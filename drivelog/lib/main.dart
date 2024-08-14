import 'package:drivelog/helpers/observer.dart';
import 'package:drivelog/pages/car/car_model_selection.dart';
import 'package:drivelog/pages/home.dart';
import 'package:drivelog/pages/root.dart';
import 'package:drivelog/services/car_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  final CarService _carService = CarService.getInstance();
  bool _carCreated = true;
  late Observer _carObserver;

  @override
  void initState() {
    _carObserver = Observer(checkCars);
    _carService.subscribe(_carObserver);
    checkCars();
    super.initState();
  }

  @override
  void dispose() {
    _carService.unsubscribe(_carObserver);
    super.dispose();
  }

  checkCars() async {
    var result = await _carService.anyCars();
    setState(() {
      _carCreated = result;
    });
  }

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
      home: _carCreated ? const RootPage() : CarModelSelectionPage(),
    );
  }
}


