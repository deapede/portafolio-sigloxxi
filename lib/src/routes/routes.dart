import 'package:flutter/material.dart';
import 'package:sigloxxi/src/pages/home.dart';
import 'package:sigloxxi/src/pages/login.dart';
import 'package:sigloxxi/src/pages/register.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (_) => LoginPage(),
  'home': (_) => HomePage(),
  'register': (_) => RegisterPage(),
};
