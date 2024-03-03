import 'package:diary_emotional_frontend/config/router/app_paths.dart';
import 'package:diary_emotional_frontend/features/account/auth/ui/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpStepAccountScreen extends StatelessWidget {
  const SignUpStepAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registro'),
        ),
        body: Center(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.alternate_email_sharp),
                              labelText: 'Nickname',
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              labelText: 'Correo Electrónico',
                            ),
                          ),
                          const SizedBox(height: 20),
                          PasswordFormField(
                            onChangedCallBack: (string) => print('Hola'),
                          ),
                          const SizedBox(height: 20),
                          PasswordFormField(
                            label: 'Confirmar Contraseña',
                            onChangedCallBack: (string) => print('Hola'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: () => context.push(AppPaths.signUpContact),
                      child: const Text('Siguiente Paso'),
                    ),
                    const Divider(
                      height: 50,
                      thickness: 2,
                    ),
                    TextButton(
                        onPressed: () => context.go(AppPaths.logIn),
                        child: const Column(
                          children: <Text>[
                            Text('¿Ya tienes cuenta?'),
                            Text('Inicia sesión'),
                          ],
                        )),
                  ],
                ),
              )),
        ));
  }
}
