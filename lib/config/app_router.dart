import 'package:diary_emotional_frontend/features/account/auth/ui/screens/login_screen.dart';
import 'package:diary_emotional_frontend/features/account/auth/ui/screens/sign_up_multi_step/step_account_screen.dart';
import 'package:diary_emotional_frontend/features/account/auth/ui/screens/sign_up_multi_step/step_contact_screen.dart';
import 'package:diary_emotional_frontend/features/account/user/ui/screens/profile_view.dart';
import 'package:diary_emotional_frontend/features/history/ui/screens/history_view.dart';
import 'package:diary_emotional_frontend/features/home/ui/layouts/home_layout.dart';
import 'package:diary_emotional_frontend/features/home/ui/screens/home_view.dart';
import 'package:diary_emotional_frontend/features/info/ui/screens/info_view.dart';
import 'package:diary_emotional_frontend/features/my_space/ui/screens/my_space_view.dart';
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
  ShellRoute(
      builder: (context, state, child) => HoneLayout(childView: child),
      routes: [
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileView(),
        ),
        GoRoute(
          path: '/history',
          builder: (context, state) => const HistoryView(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeView(),
          routes: [
            GoRoute(
              path: 'diary',
              builder: (context, state) => const ProfileView(),
            ),
            GoRoute(
              path: 'transcendentalEmotions',
              builder: (context, state) => const InfoView(),
            ),
          ],
        ),
        GoRoute(
          path: '/info',
          builder: (context, state) => const InfoView(),
        ),
        GoRoute(
          path: '/mySpace',
          builder: (context, state) => const MySpaceView(),
        ),
      ])
]);
