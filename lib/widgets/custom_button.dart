import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.onpressed,
    required this.text,
    super.key,
  });
  final String text;
  VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        onPressed: onpressed,
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 50,
          child: Text(text),
        ));
  }
}
