import 'dart:async';

import 'package:drivelog/db/db_service.dart';
import 'package:drivelog/db/models/car_dao.dart';
import 'package:drivelog/db/models/refuel_dao.dart';
import 'package:drivelog/db/models/trip_dao.dart';
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


  int selectedMenu = 1;
  double distance = 0;
  double fuelConsumption = 0;

  @override
  initState() {
    super.initState();
  }

  _save() {
    if(selectedMenu == 1 && distance != 0){
      var tripDAO = TripDAO(distance: distance, fuelConsumption: fuelConsumption == 0 ? null : fuelConsumption, carFK: 1);
      _carService.addTrip(tripDAO);
      Navigator.pop(context);
    }
    else if(selectedMenu == 2 && fuelConsumption != 0){
      var refuelDAO = RefuelDAO(fuelAmount: fuelConsumption, distance: distance == 0 ? null : distance, carFK: 1);
      _carService.addRefuel(refuelDAO);
      Navigator.pop(context);
    }

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
        CustomNumberInput(onChange: (x) => {distance = x}, unit: "km",),
        //SizedBox(height: 30,),

        titleText("Fuel Consumption"),
        CustomNumberInput(onChange: (x) => {fuelConsumption = x}, unit: "l"),
      ],
    );
  }

  Widget refuelWidget(){
    return Column(
      children: [
        titleText("Fuel"),
        CustomNumberInput(onChange: (x) => {fuelConsumption = x}, unit: "l"),
        //SizedBox(height: 30,),

        titleText("Mileage"),
        CustomNumberInput(onChange: (x) => {distance = x}, unit: "km"),
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
              SelectionHeader(text1: "Trip", text2: "Refuel", selectedOption: selectedMenu, changed: (i) {
                setState(() {
                  selectedMenu = i;
                });
              },),
              const Spacer(flex: 1,),
              selectedMenu == 1 ? tripWidget() : refuelWidget(),
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
