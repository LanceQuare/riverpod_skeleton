import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hi_riveroid/utils/router/routes.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _calculateSelectedIndex(context),
      onTap: (int index) {
        switch (index) {
          case 0:
            // HomeRoute().pushReplacement(context);
            context.go(HomeRoute().location);
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
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String router = GoRouter.of(context).routerDelegate.currentConfiguration.uri.path;
    print("Lance Test: router: $router");
    if (router == const TheBRoute().location) {
      return 1;
    }
    if (router == const PreferenceRoute().location) {
      return 2;
    }
    return 0;
  }
}