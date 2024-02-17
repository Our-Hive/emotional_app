import 'package:flutter/material.dart';

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
                  decoration: InputDecoration(
                      fillColor: Theme.of(context).colorScheme.surface,
                      prefixIcon: const Icon(Icons.mail),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Correo Electrónico'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  autocorrect: false,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Contraseña',
                    suffixIcon: IconButton(
                      onPressed: () => print('show password'),
                      icon: const Icon(Icons.visibility_off),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          FilledButton(
              onPressed: () => print('Login'),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      const Size(double.infinity, 50))),
              child: const Text('Login')),
          const Divider(
            height: 50,
            thickness: 2,
          ),
          TextButton(
              onPressed: () => print('register'),
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
