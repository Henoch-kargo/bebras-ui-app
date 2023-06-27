import 'package:flutter/material.dart';

class ToggleButtonLoginRegister extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isSelected;
  final String text;

  ToggleButtonLoginRegister({
    required this.onPressed,
    required this.isSelected,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(140, 50)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: text == 'Login' ? BorderRadius.only(
              topLeft: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0),
            ) : BorderRadius.only(
              topRight: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
            side: BorderSide(color: Color(0xff0d53ff), width: 2.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          isSelected
              ? Color(0xff0d53ff)
              : Colors.white,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Color(0xffdae4ff),
          fontSize: 22.0,
        ),
      ),
    );
  }
}