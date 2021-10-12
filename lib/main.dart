import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sigloxxi/src/providers/login_form_provider.dart';
import 'package:sigloxxi/src/routes/routes.dart';
import 'package:sigloxxi/src/services/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotificationService()),
        ChangeNotifierProvider(create: (_) => LoginService()),
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
        ChangeNotifierProvider(create: (_) => FoodPlateService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restaurant Sigo XXI',
        initialRoute: 'loading',
        routes: appRoutes,
      ),
    );
  }
}
