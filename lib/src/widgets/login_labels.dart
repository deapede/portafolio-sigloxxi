import 'package:flutter/material.dart';

class BottomLoginLabels extends StatelessWidget {
  final String primerTexto;
  final String segundoTexto;
  final String ruta;

  const BottomLoginLabels({
    required this.primerTexto,
    required this.segundoTexto,
    required this.ruta,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Text(
          this.primerTexto,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, this.ruta);
          },
          child: Text(
            this.segundoTexto,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
