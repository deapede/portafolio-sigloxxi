import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sigloxxi/src/providers/notification.dart';

import 'package:sigloxxi/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Restaurant Sigo XXI',
        initialRoute: 'home',
        routes: appRoutes,
      ),
    );
  }
}
