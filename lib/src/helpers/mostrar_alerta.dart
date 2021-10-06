import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

mostrarAlerta(BuildContext context, String titulo, String contenido) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(titulo),
      content: Text(contenido),
      actions: [
        MaterialButton(
          child: Text('OK'),
          textColor: Color(0xffEA7B00),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}
