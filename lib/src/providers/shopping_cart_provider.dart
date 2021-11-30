import 'package:flutter/cupertino.dart';

class ShoppingCartProvider extends ChangeNotifier {
  int _number = 0;
  int _quantity = 0;
  late int _price;
  late AnimationController _bounceCtrl;
  List<Map<String, dynamic>> detalleOrden = [];

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
      _quantity = 0;
    }
    notifyListeners();
  }

  AnimationController get bounceCtrl => this._bounceCtrl;
  set bounceCtrl(AnimationController controller) {
    this._bounceCtrl = controller;
  }

  agregarProductos(int cantidad, int precio, String producto, String urlFoto) {
    detalleOrden.add(
      {
        'nombrePlato': producto,
        'cantidad': cantidad,
        'precio': precio,
        'foto': urlFoto,
      },
    );

    _number += cantidad;
    print(_number);
    _bounceCtrl.forward(from: 0.0);

    notifyListeners();
    // print(detalleOrden[0]['nombrePlato']);
    // print('Detalle Orden: $detalleOrden');
  }

  void eliminarProductos(int index, int cantidad) {
    detalleOrden.removeAt(index);
    _number -= cantidad;
    _bounceCtrl.forward();
    notifyListeners();
    print(_number);
  }
}
