import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_skeleton/controllers/root_controller.dart';
import 'package:riverpod_skeleton/ui/widget/bottom_navigation.dart';
import 'package:riverpod_skeleton/utils/router/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RootPage extends StatelessWidget {
  final Widget child;
  const RootPage({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Skeleton'),
      ),
      body: child,
      bottomNavigationBar: const BottomNavigation(),
    );
  }

  Widget buildTabletUI(BuildContext context, WidgetRef ref) {
    final int selectedIndex = getCurrentIndex(context);

    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.group),
                label: Text('Page B'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.group),
                label: Text('Settings'),
              ),
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: (int index) {
              switch (index) {
                case 0:
                  const DashboardRoute().go(context);
                case 1:
                  const TodoRoute().go(context);
                case 2:
                  const PreferenceRoute().go(context);
              }
            },
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: child),
        ],
      ),
    );
  }



  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith(const TodoRoute().location)) {
      return 1;
    } else if (location.startsWith(const PreferenceRoute().location)) {
      return 2;
    } else {
      return 0;
    }
  }
}