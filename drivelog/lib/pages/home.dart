import 'package:drivelog/widgets/car_display.dart';
import 'package:drivelog/widgets/mileage_table.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Column(
          children: [
            SizedBox(height: 15,),
            CarDisplay(),
            SizedBox(height: 15,),
            Text("150.000 km", style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 10,),
            MileageTable(),
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
