import 'package:flutter/cupertino.dart';

class NotificationProvider extends ChangeNotifier {
  int _number = 0;
  late AnimationController _bounceCtrl;

  int get number => this._number;

  set number(int value) {
    this._number = value;
    notifyListeners();
  }

  AnimationController get bounceCtrl => this._bounceCtrl;
  set bounceCtrl(AnimationController controller) {
    this._bounceCtrl = controller;
  }
}
