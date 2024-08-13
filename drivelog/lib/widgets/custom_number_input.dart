import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class CustomNumberInput extends StatefulWidget {
  const CustomNumberInput({super.key, required this.onChange, this.title, required this.unit, this.value, });

  final String? title;
  final String unit;
  final Function(double) onChange;
  final double? value;


  @override
  State<CustomNumberInput> createState() => _CustomNumberInputState();
}

class _CustomNumberInputState extends State<CustomNumberInput> {
  static const platform = MethodChannel('at.tobias-schiffelhumer.at/number');

  final TextEditingController _controller = TextEditingController();

  double _value = 0;

  String decimalSeparator = "x";


  getSeparator() async{
    String sep = ".";

    if(Platform.isIOS){
      final result = await platform.invokeMethod<String>('getDecimalSeparator');
      sep = result ?? ".";
    }
    else {
      Locale locale = Localizations.localeOf(context);
      sep = NumberFormat.decimalPattern(locale.toString()).toString();
    }

    setState(() {
      decimalSeparator = sep;
      _controller.text = _formatNumber(_value);
    });
  }

  @override
  void initState() {
    super.initState();

    getSeparator();

    if(widget.value != null) {
      _value = widget.value!;
    }

    _controller.text = _formatNumber(_value);
    _controller.addListener(() {
      if(_controller.text.isNotEmpty) {
        setState(() {
          var text = _controller.text;
          text = text.replaceAll(decimalSeparator, ".");
          _value = double.parse(text);
          widget.onChange(_value);
        });
      }
     });
  }

  addNumber(int number) {
    setState(() {
      _value += number;
      _controller.text =  _formatNumber(_value);
    });
  }

  final _numberFormatter = NumberFormat("##0.###");
  String _formatNumber(double number){
    final s = _numberFormatter.format(number);
    return (s.endsWith('00') ? s.substring(0, s.length - 3) : s).replaceAll(".", decimalSeparator);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0, left: 2.0),
            child: Text("${widget.title}:",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {addNumber(-1);},
                  icon: const Icon(Icons.remove, color: Colors.black,),
                ),
                Expanded(child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Row(
                    children: [
                      const Spacer(),
                      SizedBox(
                        //width: ((_value.toString().length + widget.unit.length - 1) * 10.5) + 15,
                        width: 200,
                        child: TextField(
                          controller: _controller,
                          textAlign: TextAlign.center,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true, ),
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'^\d*[.,]?\d{0,3}')),
                            //DecimalTextInputFormatter(decimalRange: 2),
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffix: Text(widget.unit),
                          ),
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (_controller.text.isEmpty) {
                              _controller.text = '0';
                            }
                          },
                        )
                      ),
                      const Spacer(),
                    ],
                  ),
                )),
                IconButton(
                  onPressed: () {addNumber(1);},
                  icon: const Icon(Icons.add, color: Colors.black,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
