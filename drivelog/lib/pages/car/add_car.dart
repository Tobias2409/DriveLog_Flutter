import 'package:drivelog/widgets/car_display.dart';
import 'package:drivelog/widgets/custom_button.dart';
import 'package:drivelog/widgets/custom_number_input.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_text_input.dart';

class AddCarPage extends StatelessWidget {
  const AddCarPage({super.key, required this.color});

  final String color;

  Widget titleText(String text){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 5),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
               const Row(
                children: [
                  Text(
                    "Add Car",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              CarDisplay(color: color,),
              const SizedBox(height: 20,),
              titleText("Name"),
              CustomTextInput(changed: (val){print(val);},),
              const Spacer(),
              Row(children: [
                const Spacer(),
                CustomButton(onPressed: (){}, text: "Add")
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
