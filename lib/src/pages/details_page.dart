import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sigloxxi/src/providers/providers.dart';
import 'package:sigloxxi/src/services/services.dart';
import 'package:sigloxxi/src/widgets/custom_floating_button.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PlatesResponse foodPlatesService =
        ModalRoute.of(context)!.settings.arguments as PlatesResponse;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEA7B00),
        elevation: 2,
        centerTitle: true,
        title: Text(
          'Detalles',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),
      body: _CardPlatos(foodPlatesService: foodPlatesService),
      floatingActionButton: ShoppingCartButton(
        onPressed: () {
          Navigator.pushNamed(context, 'cart_page');
        },
      ),
    );
  }
}

class _CardPlatos extends StatelessWidget {
  const _CardPlatos({
    Key? key,
    required this.foodPlatesService,
  }) : super(key: key);

  final PlatesResponse foodPlatesService;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: Image(
                      image: NetworkImage(foodPlatesService.link!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    alignment: Alignment.bottomCenter,
                    color: Colors.black38,
                    height: 200,
                    width: double.infinity,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              foodPlatesService.name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(foodPlatesService.description),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        _BotonAgregarRestar(),
        _BotonAgregarCarrito(foodPlatesService: foodPlatesService),
      ],
    );
  }
}

class _BotonAgregarCarrito extends StatelessWidget {
  const _BotonAgregarCarrito({
    Key? key,
    required this.foodPlatesService,
  }) : super(key: key);

  final PlatesResponse foodPlatesService;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ShoppingCartProvider>(context);
    final precioTotal = foodPlatesService.price * cartProvider.quantity;
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 50, right: 50, bottom: 90),
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xffFD9827),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Agregar al carrito: \$ ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '$precioTotal',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      onTap: () {
        cartProvider.agregarProductos(
            cartProvider.quantity, precioTotal, foodPlatesService.name);
      },
    );
  }
}

class _BotonAgregarRestar extends StatelessWidget {
  const _BotonAgregarRestar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<ShoppingCartProvider>(context);
    return Container(
      margin: EdgeInsets.only(left: 50, right: 50, bottom: 10),
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xffFD9827),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
              ),
              child: Icon(Icons.remove),
            ),
            onTap: () {
              cartProvider.removeFromCart();
            },
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '${cartProvider.quantity}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Spacer(),
          GestureDetector(
            child: Container(
              width: 70,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
              child: Icon(Icons.add),
            ),
            onTap: () {
              cartProvider.addToCart();
            },
          ),
        ],
      ),
    );
  }
}



// ! onpressed para cuando se agrega algo al carro de compras
          // onPressed: () {
          //   final notificationProvider =
          //       Provider.of<NotificationProvider>(context, listen: false);
          //   notificationProvider.number++;

          //   if (notificationProvider.number >= 2) {
          //     notificationProvider.bounceCtrl.forward(from: 0.0);
          //   }
          // },