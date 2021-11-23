import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigloxxi/src/providers/providers.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ShoppingCartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEA7B00),
        elevation: 2,
        centerTitle: true,
        title: Text(
          'Carrito',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: cartProvider.pedido.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Producto'),
                      Text('Cantidad'),
                      Text('Precio'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${cartProvider.pedido[0]['order_details']['nombrePlato']}',
                      ),
                      Text(
                        '${cartProvider.pedido[0]['order_details']['cantidad'].toString()}',
                      ),
                      Text(
                        '${cartProvider.pedido[0]['order_details']['precio'].toString()}',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
