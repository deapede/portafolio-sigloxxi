import 'package:flutter/material.dart';
// import 'package:sigloxxi/src/ui/input_decorations.dart';

import 'package:sigloxxi/src/widgets/widgets.dart';

class LoginPage extends StatelessWidget {
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
                      'Ingreso',
                      style: TextStyle(
                        fontSize: 40,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomFormFields(
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'Correo electrónico',
                      prefixIcon: Icons.alternate_email,
                      autocorrect: false,
                    ),
                    CustomFormFields(
                      keyboardType: TextInputType.text,
                      labelText: 'Password',
                      prefixIcon: Icons.lock_outline,
                      autocorrect: false,
                      isPassword: true,
                    ),
                    CustomButton(
                      texto: 'Ingresar',
                      onPressed: () {
                        // TODO: Implementar login app
                      },
                    ),
                  ],
                ),
              ),
              BottomLoginLabels(
                primerTexto: '¿No tienes cuenta?',
                segundoTexto: 'Crea una nueva cuenta',
                ruta: 'register',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
