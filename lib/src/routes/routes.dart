import 'package:flutter/material.dart';
import 'package:sigloxxi/src/pages/pages.dart';
import 'package:sigloxxi/src/pages/register_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'login': (_) => LoginPage(),
  'home': (_) => HomePage(),
  'register': (_) => RegisterPage(),
  'details': (_) => DetailsPage(),
  'loading': (_) => LoadingPage(),
  'cart_page': (_) => CartPage(),
};
