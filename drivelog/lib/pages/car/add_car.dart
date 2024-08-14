import 'package:drivelog/db/db_service.dart';
import 'package:drivelog/db/models/car_dao.dart';
import 'package:drivelog/services/car_service.dart';
import 'package:drivelog/widgets/car_display.dart';
import 'package:drivelog/widgets/custom_button.dart';
import 'package:drivelog/widgets/custom_number_input.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_text_input.dart';

class AddCarPage extends StatefulWidget {
  const AddCarPage({super.key, required this.color});

  final String color;

  @override
  State<AddCarPage> createState() => _AddCarPageState();
}

class _AddCarPageState extends State<AddCarPage> {

  String _carName = "";

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

  _saveCar() async {
    if(_carName.length <= 2){
      return;
    }

    var dao = CarDAO(name: _carName, modelColor: widget.color, modelType: 'car');

    var carService = CarService.getInstance();
    await carService.addCar(dao);

    if (mounted) {
      Navigator.pop(context);
    }
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
              CarDisplay(color: widget.color,),
              const SizedBox(height: 20,),
              titleText("Name"),
              CustomTextInput(changed: (val){_carName = val;},),
              const Spacer(),
              Row(children: [
                const Spacer(),
                CustomButton(onPressed: _saveCar, text: "Add")
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
