import 'package:flutter/material.dart';

class OrderDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEA7B00),
        elevation: 2,
        centerTitle: true,
        title: Text(
          'Detalle de Orden',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Center(
        child: Text('Order Detail'),
      ),
    );
  }
}
