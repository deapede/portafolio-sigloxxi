import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sigloxxi/src/providers/login_form.dart';
// import 'package:sigloxxi/src/ui/input_decorations.dart';

import 'package:sigloxxi/src/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Scaffold(
      body: LoginBackground(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 250),
              LoginCard(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Ingreso',
                      style: TextStyle(
                        fontSize: 40,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 30),
                    LoginFormFields(),
                    CustomButton(
                      texto:
                          loginForm.isLoading ? 'Espere por favor' : 'Ingresar',
                      isForm: true,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        // TODO: Implementar login app

                        if (!loginForm.isValidForm()) return;

                        loginForm.isLoading = true;

                        // TODO: colocar navegación a página siguiente
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginFormFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              obscureText: false,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffEA7B00),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffEA7B00),
                    width: 2,
                  ),
                ),
                hintText: 'Correo electrónico',
                labelText: 'Correo electrónico',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: Icon(
                  Icons.alternate_email_outlined,
                  color: Color(0xffEA7B00),
                ),
              ),
            ),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffEA7B00),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffEA7B00),
                    width: 2,
                  ),
                ),
                hintText: 'Password',
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Color(0xffEA7B00),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
