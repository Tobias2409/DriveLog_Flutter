
import 'package:flutter/material.dart';

class SelectionHeader extends StatelessWidget {
  const SelectionHeader({super.key, required this.text1, required this.text2, required this.selectedOption, required this.changed});

  final String text1;
  final String text2;
  final int selectedOption;
  final Function(int) changed;

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
              onTap: () => changed(1),
              child: Container(
                color: selectedOption == 1 ? Colors.white : null,
                child: Center(
                  child: Text(
                  text1,
                  style: TextStyle(
                    color: selectedOption == 1 ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => changed(2),
              child: Container(
                color: selectedOption == 2 ? Colors.white : null,
                child: Center(
                  child: Text(
                    text2,
                    style:  TextStyle(
                      color: selectedOption == 2 ? Colors.black : Colors.white,
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
