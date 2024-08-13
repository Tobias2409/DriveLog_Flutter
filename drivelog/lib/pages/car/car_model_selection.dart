import 'dart:math';

import 'package:drivelog/pages/car/add_car.dart';
import 'package:drivelog/widgets/car_display.dart';
import 'package:flutter/material.dart';

class CarModelSelectionPage extends StatelessWidget {
  CarModelSelectionPage({super.key});

  final _cars = [
    "white",
    "grey_light",
    "grey",
    "black",
    "blue_light",
    "blue",
    "green_light",
    "yellow",
    "orange",
    "red",
  ];

  Widget _getCarDisplay(int i, BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddCarPage(color: _cars[i]),
          ),
        );
      },
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 2,
        height: MediaQuery.sizeOf(context).width / 3.3,
        child: CarDisplay(color: _cars[i],),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Transform.translate(
              offset: Offset.fromDirection(pi, -6),
              child: Column(
                children: [
                  const Spacer(flex: 1,),
                  for(var i = 0; i <_cars.length; i += 2)
                    Row(
                      children: [
                        _getCarDisplay(i, context),
                        _getCarDisplay(i + 1, context),
                      ],
                    ),
                  const Spacer(flex: 2,),
                ],
              ),
            ),
        )
    );
  }
}
