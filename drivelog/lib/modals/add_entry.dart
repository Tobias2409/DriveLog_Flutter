import 'package:drivelog/widgets/custom_button.dart';
import 'package:drivelog/widgets/custom_number_input.dart';
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
              CustomNumberInput(onChange: (i) => {print("change")}, unit: "km"),
              Spacer(),
              Row(
                children: [
                  Spacer(),
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
