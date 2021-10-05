import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sigloxxi/src/providers/login_form.dart';

import 'package:sigloxxi/src/widgets/widgets.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 250),
              LoginCard(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Registro',
                      style: TextStyle(
                        fontSize: 40,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 30),
                    RegisterFormFields(),
                    CustomButton(
                      texto: 'Crear cuenta',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              BottomLoginLabels(
                primerTexto: '¿Ya tienes cuenta?',
                segundoTexto: 'Ingresa a tu cuenta',
                ruta: 'login',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterFormFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        // key: loginForm.formKey,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              obscureText: false,
              textInputAction: TextInputAction.next,
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
                hintText: 'Nombre',
                labelText: 'Nombre',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: Icon(
                  Icons.perm_identity,
                  color: Color(0xffEA7B00),
                ),
              ),
            ),
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
