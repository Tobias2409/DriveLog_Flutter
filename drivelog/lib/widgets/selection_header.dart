
import 'package:flutter/material.dart';

class SelectionHeader extends StatelessWidget {
  const SelectionHeader({super.key,});


  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        border: Border.all(color: Colors.white, style: BorderStyle.solid),
        //color: Colors.pink,
      ),
      height: 40,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: Container(
                color: Colors.white,
                child: const Center(
                  child: Text(
                    "Refuel",
                    style:  TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}
