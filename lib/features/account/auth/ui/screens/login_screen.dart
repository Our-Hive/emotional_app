import 'package:diary_emotional_frontend/features/account/auth/ui/provider/auth_provider.dart';
import 'package:diary_emotional_frontend/features/account/auth/ui/provider/login_form_provider.dart';
import 'package:diary_emotional_frontend/features/account/auth/ui/widgets/password_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(loginFormProvider, (previous, next) {
      if (next.isSubmitting) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text('Validando...'),
            ),
          );
      }
    });
    ref.listen(authNProvider, (previous, next) {
      if (next.isLoading) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text('Iniciando Sesión...'),
            ),
          );
      }
      if (next.error.isNotEmpty) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text(next.error),
            ),
          );
      }
    });
    ref.listen(authNProvider, (previous, next) {
      if (next.isAuth) {
        context.go('/profile');
      }
    });
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: ImageFiltered(
                      imageFilter: const ColorFilter.mode(
                        Colors.yellow,
                        BlendMode.srcATop,
                      ),
                      child: Image.asset(
                        'assets/app_image.png',
                      ),
                    ),
                  ),
                  const _LoginForm(),
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
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends ConsumerWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.mail),
              labelText: 'Correo Electrónico',
            ),
            onChanged: (value) => ref
                .read(loginFormProvider.notifier)
                .onEmailChanged(value.trim().toLowerCase()),
          ),
          const SizedBox(height: 20),
          PasswordFormField(
            onChangedCallBack: (value) => ref
                .read(loginFormProvider.notifier)
                .onPasswordChanged(value.trim().toLowerCase()),
          ),
          const SizedBox(height: 20),
          FilledButton(
              onPressed: () {
                ref.read(loginFormProvider.notifier).onSubmit();
                final loginFormData = ref.read(loginFormProvider);
                ref
                    .read(authNProvider.notifier)
                    .login(loginFormData.email, loginFormData.password);
              },
              //style:
              child: const Text('Inicio de Sesión')),
        ],
      ),
    );
  }
}
