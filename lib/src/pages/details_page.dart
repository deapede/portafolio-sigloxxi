import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

import 'package:sigloxxi/src/providers/providers.dart';
import 'package:sigloxxi/src/services/services.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final PlatesResponse foodPlatesService =
        ModalRoute.of(context)!.settings.arguments as PlatesResponse;
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          _CustomAppBar(foodPlate: foodPlatesService),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _CardPlates(foodPlate: foodPlatesService),
                _BotonAgregarRestar(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _ShoppingCartButton(),
    );
  }
}

class _BotonAgregarRestar extends StatelessWidget {
  const _BotonAgregarRestar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xffFD9827),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
            ),
            child: Icon(Icons.add),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '1',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Spacer(),
          Container(
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
            ),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final PlatesResponse foodPlate;

  const _CustomAppBar({Key? key, required this.foodPlate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Color(0xff1F1F1F),
      expandedHeight: 200,
      elevation: 2,
      pinned: true,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          alignment: Alignment.bottomCenter,
          color: Colors.black38,
          width: double.infinity,
          // height: 200,
          child: Text(
            foodPlate.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              letterSpacing: 1,
            ),
          ),
        ),
        background: Image(
          image: NetworkImage(foodPlate.link!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _CardPlates extends StatelessWidget {
  final PlatesResponse foodPlate;

  const _CardPlates({Key? key, required this.foodPlate}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 150,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(foodPlate.description),
          ],
        ),
      ),
    );
  }
}

class _ShoppingCartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationProvider>(context);

    return FloatingActionButton(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            color: Color(0xffFD9827),
            size: 30,
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            child: BounceInDown(
              from: 10,
              animate: (notificationProvider.number > 0) ? true : false,
              child: Bounce(
                from: 10,
                controller: (controller) =>
                    Provider.of<NotificationProvider>(context).bounceCtrl =
                        controller,
                child: Container(
                  alignment: Alignment.center,
                  width: 13,
                  height: 13,
                  child: Text(
                    '${notificationProvider.number}',
                    style: TextStyle(color: Colors.white, fontSize: 7),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      onPressed: () {
        // TODO Implementar navegación a página de Carrito para generar orden.
      },
      backgroundColor: Color(0xff1F1F1F),
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