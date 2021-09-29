import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String texto;

  const CustomButton({required this.onPressed, required this.texto});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      disabledColor: Colors.grey,
      elevation: 0,
      color: Color(0xffFD9827),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: Text(
          this.texto,
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}
