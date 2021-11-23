import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:animate_do/animate_do.dart';
import 'package:sigloxxi/src/providers/providers.dart';

class ShoppingCartButton extends StatelessWidget {
  final void Function() onPressed;

  const ShoppingCartButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<ShoppingCartProvider>(context);

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
                    notificationProvider.bounceCtrl = controller,
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
      onPressed: onPressed,
      backgroundColor: Color(0xff1F1F1F),
    );
  }
}
