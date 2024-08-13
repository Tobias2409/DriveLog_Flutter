import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextInput extends StatefulWidget {
  const CustomTextInput({super.key, this.hintText, this.formatters, required this.changed, this.value});

  final String? value;
  final String? hintText;
  final List<TextInputFormatter>? formatters;
  final Function(String) changed;

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {

  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.text = widget.value ?? "";
    _controller.addListener(() {
      widget.changed(_controller.text);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.5),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: _controller,
          inputFormatters: widget.formatters,
          decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
        ),
      ),
    );
  }
}
