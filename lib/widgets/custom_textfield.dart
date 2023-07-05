import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.hintText,
    this.inputType,
    this.prefix,
    this.onChanged,
  });
  String? hintText;
  Widget? prefix;
  Function(String)? onChanged;
  TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
          keyboardType: inputType,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefix,
            labelStyle: const TextStyle(fontSize: 14, color: Colors.black),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.black, width: 2)),
            floatingLabelStyle:
                const TextStyle(color: Colors.black, fontSize: 18),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.black, width: 1.5)),
          )),
    );
  }
}
