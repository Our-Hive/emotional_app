import 'package:diary_emotional_frontend/features/account/auth/ui/screens/login_screen.dart';
import 'package:diary_emotional_frontend/features/account/auth/ui/screens/sign_up_multi_step/step_account_screen.dart';
import 'package:diary_emotional_frontend/features/account/auth/ui/screens/sign_up_multi_step/step_contact_screen.dart';
import 'package:diary_emotional_frontend/features/account/user/ui/screens/profile_view.dart';
import 'package:diary_emotional_frontend/features/history/ui/screens/history_view.dart';
import 'package:diary_emotional_frontend/features/home/ui/layouts/home_layout.dart';
import 'package:diary_emotional_frontend/features/home/ui/screens/home_view.dart';
import 'package:diary_emotional_frontend/features/info/ui/screens/info_view.dart';
import 'package:diary_emotional_frontend/features/my_space/ui/screens/my_space_view.dart';
import 'package:diary_emotional_frontend/config/router/app_paths.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: AppPaths.logIn, routes: [
  GoRoute(
    path: AppPaths.logIn,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: AppPaths.signUp,
    builder: (context, state) => const SignUpStepAccountScreen(),
  ),
  GoRoute(
    path: AppPaths.signUpContact,
    builder: (context, state) => const SignUpStepContactScreen(),
  ),
  ShellRoute(
      builder: (context, state, child) => HoneLayout(childView: child),
      routes: [
        GoRoute(
          path: AppPaths.profile,
          builder: (context, state) => const ProfileView(),
        ),
        GoRoute(
          path: AppPaths.history,
          builder: (context, state) => const HistoryView(),
        ),
        GoRoute(
          path: AppPaths.home,
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
          path: AppPaths.info,
          builder: (context, state) => const InfoView(),
        ),
        GoRoute(
          path: AppPaths.mySpace,
          builder: (context, state) => const MySpaceView(),
        ),
      ])
]);
