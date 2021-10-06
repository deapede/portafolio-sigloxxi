import 'package:flutter/material.dart';
import 'package:sigloxxi/src/pages/home_page.dart';
import 'package:sigloxxi/src/pages/login_page.dart';
import 'package:sigloxxi/src/pages/pages.dart';
import 'package:sigloxxi/src/pages/register_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (_) => LoginPage(),
  'home': (_) => HomePage(),
  'register': (_) => RegisterPage(),
  'details': (_) => DetailsPage(),
};
