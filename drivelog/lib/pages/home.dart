import 'package:drivelog/widgets/car_display.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Row(
              children: [
                const SizedBox(width: 30,),
                Text("Car 1", style: Theme.of(context).textTheme.headlineLarge),
              ],
            ),
            const CarDisplay(),
          ],
        ),
      ),
    );
  }
}
