import 'dart:async';

import 'package:drivelog/db/db_service.dart';
import 'package:drivelog/db/models/car_dao.dart';
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

  int _selectedMenu = 1;
  Future<DBService> dbService = DBService.getInstance();
  
  @override
  initState() {
    
    var car = CarDAO(name: "Corsa", image: "hee");
    dbService.then((db) {
      db.insert(car);
    });

    
    super.initState();
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
        CustomNumberInput(onChange: (i) => {print("change")}, unit: "km",),
        //SizedBox(height: 30,),

        titleText("Fuel Consumption"),
        CustomNumberInput(onChange: (i) => {print("change")}, unit: "l"),
      ],
    );
  }

  Widget refuelWidget(){
    return Column(
      children: [
        titleText("Fuel"),
        CustomNumberInput(onChange: (i) => {print("change")}, unit: "l"),
        //SizedBox(height: 30,),

        titleText("Mileage"),
        CustomNumberInput(onChange: (i) => {print("change")}, unit: "km"),
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
              SelectionHeader(text1: "Trip", text2: "Refuel", selectedOption: _selectedMenu, changed: (i) {
                setState(() {
                  _selectedMenu = i;
                });
              },),
              const Spacer(flex: 1,),
              _selectedMenu == 1 ? tripWidget() : refuelWidget(),
              const Spacer(flex: 2,),
              Row(
                children: [
                  const Spacer(),
                  CustomButton(onPressed: () => print("hee"), text: "Save")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
