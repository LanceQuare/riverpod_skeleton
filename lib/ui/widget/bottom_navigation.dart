import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_skeleton/utils/router/routes.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _calculateSelectedIndex(context),
      onTap: (int index) {
        switch (index) {
          case 0:
            // HomeRoute().pushReplacement(context);
            context.go(DashboardRoute().location);
            break;
          case 1:
            context.go(const TheBRoute().location);
            break;
          case 2:
            context.go(const PreferenceRoute().location);
            break;
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Page B',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouter.of(context).routerDelegate.currentConfiguration.uri.path;
    if (location.startsWith(const TheBRoute().location)) {
      return 1;
    }else if (location.startsWith(const PreferenceRoute().location)) {
      return 2;
    } else {
      return 0;
    }
  }
}