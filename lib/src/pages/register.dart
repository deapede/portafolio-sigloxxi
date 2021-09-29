import 'package:flutter/material.dart';

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
                    CustomFormFields(
                      keyboardType: TextInputType.text,
                      labelText: 'Nombre',
                      prefixIcon: Icons.perm_identity,
                    ),
                    CustomFormFields(
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'Correo electrónico',
                      prefixIcon: Icons.alternate_email,
                    ),
                    CustomFormFields(
                      keyboardType: TextInputType.text,
                      labelText: 'Password',
                      isPassword: true,
                      prefixIcon: Icons.lock_outline,
                    ),
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

// class RegisterForm extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Form(
//         child: Column(
//           children: [
//             TextFormField(
//               autocorrect: false,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecorations.loginInputDecoration(
//                 hintText: 'correo@correo.cl',
//                 labelText: 'Correo electrónico',
//                 prefixIcon: Icons.alternate_email,
//               ),
//             ),
//             SizedBox(height: 30),
//             TextFormField(
//               autocorrect: false,
//               keyboardType: TextInputType.text,
//               decoration: InputDecorations.loginInputDecoration(
//                 hintText: 'Nombre',
//                 labelText: 'Nombre',
//                 prefixIcon: Icons.perm_identity_outlined,
//               ),
//             ),
//             SizedBox(height: 30),
//             TextFormField(
//               autocorrect: false,
//               obscureText: true,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecorations.loginInputDecoration(
//                 labelText: 'Password',
//                 prefixIcon: Icons.lock_outline,
//               ),
//             ),
//             SizedBox(height: 30),
//             MaterialButton(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               disabledColor: Colors.grey,
//               elevation: 0,
//               color: Colors.deepPurple,
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
//                 child: Text(
//                   'Ingresar',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               onPressed: () {
//                 // TODO: implementar login
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
