import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;

  const TextFieldInput(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context),
        borderRadius: const BorderRadius.all(Radius.circular(12)));

    return TextField(
      controller: textEditingController,
      style: const TextStyle(
          fontFamily: 'Opensans',
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
            fontFamily: 'Opensans', fontSize: 16, color: Colors.black),
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        fillColor: const Color.fromRGBO(245, 245, 245, 1.0),
        contentPadding: const EdgeInsets.all(10),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
