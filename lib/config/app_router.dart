import 'package:diary_emotional_frontend/features/account/auth/ui/screen/login_screen.dart';
import 'package:diary_emotional_frontend/features/account/auth/ui/screen/sign_up_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/login', routes: [
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/signUp',
    builder: (context, state) => const SignUpScreen(),
  ),
]);
