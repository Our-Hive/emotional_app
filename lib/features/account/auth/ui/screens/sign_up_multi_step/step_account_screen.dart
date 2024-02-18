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
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.alternate_email_sharp),
                            labelText: 'Nickname'),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            labelText: 'Correo Electrónico'),
                      ),
                      const SizedBox(height: 20),
                      const PasswordFormField(),
                      const SizedBox(height: 20),
                      const PasswordFormField(
                        label: 'Confirmar Contraseña',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton(
                    onPressed: () => context.push('/signUp/contact'),
                    child: const Text('Siguiente Paso')),
                const Divider(
                  height: 50,
                  thickness: 2,
                ),
                TextButton(
                    onPressed: () => context.go('/login'),
                    child: const Column(
                      children: <Text>[
                        Text('¿Ya tienes cuenta?'),
                        Text('Inicia sesión'),
                      ],
                    )),
              ],
            )));
  }
}
