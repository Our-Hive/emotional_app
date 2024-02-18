import 'package:diary_emotional_frontend/features/account/auth/ui/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Placeholder(
            fallbackHeight: 300,
          ),
          const SizedBox(height: 20),
          Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      labelText: 'Correo Electrónico'),
                ),
                const SizedBox(height: 20),
                const PasswordFormField()
              ],
            ),
          ),
          const SizedBox(height: 20),
          FilledButton(
              onPressed: () => print('Inicio de Sesión'),
              //style:
              child: const Text('Inicio de Sesión')),
          const Divider(
            height: 50,
            thickness: 2,
          ),
          TextButton(
              onPressed: () => context.go('/signUp'),
              child: const Column(
                children: <Text>[
                  Text('¿No puedes iniciar sesión?'),
                  Text('Crear Cuenta'),
                ],
              )),
        ],
      ),
    ));
  }
}
