
import 'package:drivelog/db/models/refuel_dao.dart';
import 'package:drivelog/services/car_service.dart';
import 'package:drivelog/widgets/custom_button.dart';
import 'package:drivelog/widgets/custom_number_input.dart';
import 'package:drivelog/widgets/selection_header.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddEntryModal extends StatefulWidget {
  const AddEntryModal._({super.key});

  static show(BuildContext context){
    showBarModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const AddEntryModal._(),
    );
  }

  @override
  State<AddEntryModal> createState() => _AddEntryModalState();
}

class _AddEntryModalState extends State<AddEntryModal> {
  final _carService = CarService.getInstance();


  double distance = 0;
  double fuelConsumption = 0;


  _save() {
      var refuelDAO = RefuelDAO(fuelAmount: fuelConsumption, distance: distance, carFK: 1);
      _carService.addRefuel(refuelDAO);
      Navigator.pop(context);
  }

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

  Widget tripWidget(){
    return Column(
      children: [
        titleText("Distance"),
        CustomNumberInput(onChange: (x) => {distance = x}, value: distance, unit: "km",),
        //SizedBox(height: 30,),

        titleText("Fuel Consumption"),
        CustomNumberInput(onChange: (x) => {fuelConsumption = x}, value: fuelConsumption, unit: "l"),
      ],
    );
  }

  Widget refuelWidget(){
    return Column(
      children: [
        titleText("Fuel"),
        CustomNumberInput(onChange: (x) => {fuelConsumption = x}, value: fuelConsumption, unit: "l",),
        //SizedBox(height: 30,),

        titleText("Mileage"),
        CustomNumberInput(onChange: (x) => {distance = x}, value: distance, unit: "km"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SelectionHeader(),
              const Spacer(flex: 1,),
              refuelWidget(),
              const Spacer(flex: 2,),
              Row(
                children: [
                  const Spacer(),
                  CustomButton(onPressed: _save, text: "Save")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
