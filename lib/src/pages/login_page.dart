import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sigloxxi/src/helpers/navegar_fadein.dart';
import 'package:sigloxxi/src/pages/home_page.dart';
import 'package:sigloxxi/src/providers/login_form_provider.dart';

import 'package:sigloxxi/src/services/login_service.dart';
import 'package:sigloxxi/src/helpers/mostrar_alerta.dart';
import 'package:sigloxxi/src/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
    final loginService = Provider.of<LoginService>(context);
    final loginFormProvider = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginFormProvider.formKey,
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
              onChanged: (value) => loginFormProvider.email = value,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Por favor ingrese un correo';
                }

                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

                RegExp regExp = new RegExp(pattern);
                return regExp.hasMatch(value)
                    ? null
                    : 'Ingrese un correo valido';
              },
            ),
            TextFormField(
              autocorrect: false,
              obscureText: loginFormProvider.passwordVisible,
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
                suffixIcon: IconButton(
                  icon: Icon(
                    loginFormProvider.passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Color(0xffEA7B00),
                  ),
                  onPressed: () {
                    loginFormProvider.passwordVisible =
                        !loginFormProvider.passwordVisible;
                  },
                ),
              ),
              onChanged: (value) => loginFormProvider.password = value,
              validator: (value) {
                if (loginFormProvider.password.isEmpty) {
                  return 'Por favor ingrese su contraseña';
                }

                // return (value != null && value.length >= 6)
                //     ? null
                //     : 'La contraseña debe ser de 6 caracteres';
              },
            ),
            SizedBox(height: 30),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Color(0xffFD9827),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  loginService.isLoading ? 'Espere' : 'Ingresar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onPressed: loginService.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      if (!loginFormProvider.isValidForm()) return;
                      loginService.isLoading = true;

                      //* API login app
                      // appLogin(context, loginForm.email, loginForm.password);
                      final successfulLogin = await loginService.login(
                        loginFormProvider.email.trim(),
                        loginFormProvider.password.trim(),
                      );

                      if (successfulLogin) {
                        // Navigator.pushReplacementNamed(context, 'home');
                        Navigator.pushReplacement(
                            context, navegarFadeIn(context, HomePage()));
                      } else {
                        mostrarAlerta(context, '¡Login Erroneo!',
                            'Email o contraseña incorrecta');
                      }
                      loginService.isLoading = false;
                    },
            ),
          ],
        ),
      ),
    );
  }
}
