import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool _passwordVisible = true;

  bool get passwordVisible => this._passwordVisible;
  set passwordVisible(bool valor) {
    this._passwordVisible = valor;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
