import 'package:digitize_app_v1/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFieldInputHeader extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;

  const TextFieldInputHeader(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );

    return TextField(
      controller: textEditingController,
      style: const TextStyle(
          fontFamily: 'Opensans',
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            fontFamily: 'Opensans',
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.bold),
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        fillColor: primaryColor,
        contentPadding: const EdgeInsets.all(10),
      ),
      keyboardType: textInputType,
    );
  }
}
