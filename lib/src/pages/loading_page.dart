import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sigloxxi/src/helpers/navegar_fadein.dart';
import 'package:sigloxxi/src/pages/pages.dart';
import 'package:sigloxxi/src/services/services.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) => Center(
          child: Text('Espere...'),
        ),
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final loginService = Provider.of<LoginService>(context);

    final isAuthenticated = await loginService.isLoggedIn();

    if (isAuthenticated) {
      Navigator.pushReplacement(context, navegarFadeIn(context, HomePage()));
    } else {
      Navigator.pushReplacement(context, navegarFadeIn(context, LoginPage()));
    }
  }
}
