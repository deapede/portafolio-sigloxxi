import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sigloxxi/src/services/notification_service.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _CardPlates(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _ShoppingCartButton(),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
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
            'plates.name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              letterSpacing: 1,
            ),
          ),
        ),
        background: Image(
          // TODO cambiar imagen del appbar por la del plato en cuestion
          image: AssetImage('assets/images/food-banner.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _CardPlates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 150,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text('Detalles page'),
            // TextButton(
            //     onPressed: () {
            //       final notificationProvider =
            //           Provider.of<NotificationProvider>(context, listen: false);
            //       notificationProvider.number++;

            //       if (notificationProvider.number >= 2) {
            //         notificationProvider.bounceCtrl.forward(from: 0.0);
            //       }
            //     },
            //     child: Text('agregar'))
          ],
        ),
      ),
    );
  }
}

class _ShoppingCartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<NotificationService>(context);

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
                    Provider.of<NotificationService>(context).bounceCtrl =
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