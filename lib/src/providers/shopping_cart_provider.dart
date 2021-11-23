import 'package:flutter/cupertino.dart';

class ShoppingCartProvider extends ChangeNotifier {
  int _number = 1;
  int _quantity = 1;
  late int _price;
  late AnimationController _bounceCtrl;
  List<Map<String, dynamic>> pedido = [{}];

  int get number => this._number;
  int get quantity => this._quantity;
  int get price => this._price;

  set number(int value) {
    this._number = value;
    notifyListeners();
  }

  set price(int value) {
    this._price = (value * this._quantity);
    notifyListeners();
  }

  addToCart() {
    _quantity++;
    notifyListeners();
  }

  removeFromCart() {
    _quantity--;
    if (_quantity.isNegative) {
      _quantity = 1;
    }
    if (_quantity == 0) {
      _quantity = 1;
    }
    notifyListeners();
  }

  AnimationController get bounceCtrl => this._bounceCtrl;
  set bounceCtrl(AnimationController controller) {
    this._bounceCtrl = controller;
  }

  agregarProductos(int cantidad, int precio, String producto) {
    pedido = [
      {
        // 'tableId':
        // 'statusId':
        // 'creation':
        'order_details': {
          'nombrePlato': producto,
          'cantidad': cantidad,
          'precio': precio,
        }
      },
    ];

    notifyListeners();
    print(pedido);
  }
}
