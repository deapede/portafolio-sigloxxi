import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigloxxi/src/providers/providers.dart';
import 'package:sigloxxi/src/widgets/widgets.dart';

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
      body: (cartProvider.detalleOrden.isEmpty)
          ? Center(
              child: Text('No hay productos agregados'),
            )
          : _BuildListView(
              provider: cartProvider,
            ),
    );
  }
}

class _BuildListView extends StatelessWidget {
  final ShoppingCartProvider provider;
  const _BuildListView({
    Key? key,
    required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          itemCount: provider.detalleOrden.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                provider.eliminarProductos(
                  index,
                  provider.detalleOrden[index]['cantidad'],
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: Duration(milliseconds: 1000),
                    content: Text(
                      'Eliminado del carrito',
                      style: TextStyle(
                        color: Color(0xffEA7B00),
                      ),
                    ),
                  ),
                );
              },
              background: Container(
                padding: EdgeInsets.only(right: 40),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                margin: EdgeInsets.all(5),
                alignment: Alignment.centerRight,
                child: Icon(Icons.delete_outline, color: Colors.white),
              ),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 80,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(8),
                            // ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image(
                                image: NetworkImage(
                                  provider.detalleOrden[index]['foto'],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Text('Producto'),
                              SizedBox(height: 10),
                              Text(
                                '${provider.detalleOrden[index]['nombrePlato']}',
                              ),
                              Text(
                                'x ${provider.detalleOrden[index]['cantidad'].toString()}',
                              ),
                            ],
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Text('Cantidad'),
                          //     SizedBox(height: 10),
                          //     Text(
                          //       '${cartProvider.detalleOrden[index]['cantidad'].toString()}',
                          //     ),
                          //   ],
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Text('Precio'),
                              SizedBox(height: 10),
                              Text(
                                '\$${provider.detalleOrden[index]['precio'].toString()}',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Spacer(),
        CustomButton(
          onPressed: () async {
            _alertaProcesando(context);
            // await provider.crearOrder(5, 1, provider.orderList);
            // Navigator.pop(context);
            // _alertaExito(context);

            Future.delayed(
              Duration(milliseconds: 1500),
              () {
                Navigator.pop(context);
                _alertaExito(context);
              },
            );
          },
          texto: 'Generar Orden',
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Future<dynamic> _alertaExito(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('!Éxito!'),
        content: Text('Su orden ha sido creada y enviada.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(
              'Cerrar',
              style: TextStyle(color: Color(0xffEA7B00)),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _alertaProcesando(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: Color(0xffEA7B00),
                strokeWidth: 2,
              ),
              SizedBox(width: 10),
              Text('Procesando...'),
            ],
          ),
        ),
      ),
    );
  }
}
