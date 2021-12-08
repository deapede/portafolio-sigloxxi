import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import 'package:sigloxxi/src/global/conexion.dart';
import 'package:sigloxxi/src/models/login_response.dart';

class LoginService extends ChangeNotifier {
  bool _isLoading = false;
  bool _isAuthenticate = false;

  bool get isLoading => this._isLoading;
  set isLoading(bool valor) {
    this._isLoading = valor;
    notifyListeners();
  }

  bool get isAuthenticate => this._isAuthenticate;
  set isAuthenticate(bool valor) {
    this._isAuthenticate = valor;
    notifyListeners();
  }

  // Create storage
  final _storage = new FlutterSecureStorage();

  // Getter del token
  static Future<String?> getToken() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token;
  }

  static Future<void> deleteToken() async {
    final _storage = new FlutterSecureStorage();
    await _storage.delete(key: 'token');
  }

  // * Path: /users/v1/login
  // !Login endpoint
  Future login(String email, String password) async {
    final data = {'email': email, 'password': password};

    final response = await http.post(
      Uri.parse('${Conexion.apiUrl}/v1/login/'),
      body: jsonEncode(data),
    );

    this.isLoading = false;

    if (response.statusCode == 200) {
      final loginResponse = loginResponseFromJson(response.body);
      await this._guardarToken(loginResponse.accessToken);
      // print(loginResponse.accessToken);
      return true;
    } else {
      return false;
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  Future logout() async {
    return await _storage.delete(key: 'token');
  }

  Future<bool> isLoggedIn() async {
    final token = await this._storage.read(key: 'token');

    if (token != null) {
      // print(token);
      return true;
    } else {
      return false;
    }
  }
}
