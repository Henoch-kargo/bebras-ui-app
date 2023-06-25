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
        // maximumSize: MaterialStateProperty.all(Size(120, 80)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: text == 'Login' ? BorderRadius.only(
              topLeft: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0),
            ) : BorderRadius.only(
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          isSelected
              ? Colors.white
              : Color(0xffCCCCCC),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.grey,
          fontSize: 22.0,
        ),
      ),
    );
  }
}