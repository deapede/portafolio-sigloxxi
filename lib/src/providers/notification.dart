import 'package:flutter/cupertino.dart';

class NotificationProvider extends ChangeNotifier {
  int _number = 10;

  int get number => this._number;

  set number(int value) {
    this._number = value;
    notifyListeners();
  }
}
