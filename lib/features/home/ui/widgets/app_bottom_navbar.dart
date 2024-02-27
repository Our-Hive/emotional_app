import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBottomNavbar extends StatelessWidget {
  const AppBottomNavbar({Key? key}) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/profile');
        break;
      case 1:
        context.go('/history');
        break;
      case 2:
        context.go('/home');
        break;
      case 3:
        context.go('/info');
        break;
      case 4:
        context.go('/mySpace');
        break;
      default:
    }
  }

  int _getCurrentIndex(
    BuildContext context,
  ) {
    final String? path = GoRouterState.of(context).fullPath;
    switch (path) {
      case '/profile':
        return 0;
      case '/history':
        return 1;
      case '/home':
        return 2;
      case '/info':
        return 3;
      case '/mySpace':
        return 4;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    //final appColors = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      onTap: (indexSelected) => _onItemTapped(context, indexSelected),
      currentIndex: _getCurrentIndex(context),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline,
          ),
          activeIcon: Icon(
            Icons.person,
          ),
          label: 'Perfil',
          backgroundColor: Color(0xFFDECAAD),
          tooltip: 'Perfil',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history_toggle_off_outlined,
          ),
          activeIcon: Icon(
            Icons.history,
          ),
          label: 'History',
          backgroundColor: Color(0xffADD7DE),
          tooltip: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.sentiment_satisfied_outlined,
          ),
          activeIcon: Icon(
            Icons.sentiment_very_satisfied,
          ),
          label: 'Emotions',
          backgroundColor: Color(0xFFADDEB6),
          tooltip: 'Registro de Emociones',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.info_outline,
          ),
          activeIcon: Icon(
            Icons.info,
          ),
          label: 'Information',
          backgroundColor: Color(0xffC3ADDE),
          tooltip: 'Information',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border_outlined,
          ),
          activeIcon: Icon(
            Icons.favorite,
          ),
          label: 'My Space',
          backgroundColor: Color(0xffDEADCC),
          tooltip: 'My Space',
        ),
      ],
    );
  }
}
