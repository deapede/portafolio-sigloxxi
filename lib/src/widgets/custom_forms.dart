import 'package:flutter/material.dart';

class CustomFormFields extends StatelessWidget {
  final bool autocorrect;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? hintText;
  final String labelText;
  final IconData? prefixIcon;

  const CustomFormFields({
    this.autocorrect = true,
    this.isPassword = false,
    required this.keyboardType,
    this.hintText,
    required this.labelText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              autocorrect: this.autocorrect,
              obscureText: this.isPassword,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffEA7B00),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffEA7B00),
                    width: 2,
                  ),
                ),
                hintText: this.hintText,
                labelText: this.labelText,
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: (this.prefixIcon != null)
                    ? Icon(
                        this.prefixIcon,
                        color: Color(0xffEA7B00),
                      )
                    : null,
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
