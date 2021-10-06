import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sigloxxi/src/routes/routes.dart';
import 'package:sigloxxi/src/services/login_service.dart';
import 'package:sigloxxi/src/services/notification_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotificationService()),
        ChangeNotifierProvider(create: (_) => LoginService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restaurant Sigo XXI',
        initialRoute: 'login',
        routes: appRoutes,
      ),
    );
  }
}
