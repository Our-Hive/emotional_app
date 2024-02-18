import 'package:diary_emotional_frontend/features/account/auth/ui/screens/login_screen.dart';
import 'package:diary_emotional_frontend/features/account/auth/ui/screens/sign_up_multi_step/step_account_screen.dart';
import 'package:diary_emotional_frontend/features/account/auth/ui/screens/sign_up_multi_step/step_contact_screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/login', routes: [
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/signUp',
    builder: (context, state) => const SignUpStepAccountScreen(),
  ),
  GoRoute(
    path: '/signUp/contact',
    builder: (context, state) => const SignUpStepContactScreen(),
  ),
]);
