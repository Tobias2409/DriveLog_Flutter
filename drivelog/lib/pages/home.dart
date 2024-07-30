import 'dart:ffi';
import 'dart:ui';

import 'package:drivelog/widgets/car_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 15,),
            Row(
              children: [
                const SizedBox(width: 30,),
                Text("Car 1", style: Theme.of(context).textTheme.headlineLarge),
              ],
            ),
            const CarDisplay(),
            const SizedBox(height: 15,),
            const Text("150.000 km", style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {print("Add Entry");},
        child: Transform.scale(scale: 1.5, child: const Icon(Icons.add),),
      ),
    );
  }
}
