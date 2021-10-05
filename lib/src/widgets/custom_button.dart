import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigloxxi/src/providers/login_form.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String texto;
  final bool isForm;

  const CustomButton(
      {required this.onPressed, required this.texto, this.isForm = false});

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context, listen: false);
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
      onPressed: isForm
          ? (loginForm.isLoading ? null : this.onPressed)
          : this.onPressed,
    );
  }
}
