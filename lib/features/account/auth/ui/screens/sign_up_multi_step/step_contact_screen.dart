import 'package:diary_emotional_frontend/config/router/app_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpStepContactScreen extends StatelessWidget {
  const SignUpStepContactScreen({super.key});

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
                    children: [
                      const _OurHiveSignUpText(),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Nombre',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
                          labelText: 'Apellido',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'Teléfono',
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FilledButton.tonalIcon(
                          onPressed: () async {
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: DateTime.now(),
                              lastDate: DateTime.now(),
                            );
                            if (selectedDate != null) print(selectedDate);
                          },
                          icon: const Icon(Icons.calendar_today),
                          label:
                              const Text('Selecciona tu fecha de nacimiento'),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton(
                  onPressed: () => print('Regístrate'),
                  child: const Text('Regístrate'),
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
          ),
        ),
      ),
    );
  }
}

class _OurHiveSignUpText extends StatelessWidget {
  const _OurHiveSignUpText();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(fontSize: 20),
          children: <TextSpan>[
            TextSpan(
              text: 'Para',
            ),
            TextSpan(
              text: '\rOur Hive\r',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow),
            ),
            TextSpan(
              text:
                  'es importante conocerte mejor, que tal si llenas los siguientes campos :D',
            )
          ],
        ),
      ),
    );
  }
}
