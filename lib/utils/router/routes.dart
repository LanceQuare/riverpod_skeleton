import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_skeleton/ui/dashboard_page.dart';
import 'package:riverpod_skeleton/ui/root_page.dart';
import 'package:riverpod_skeleton/ui/login_page.dart';
import 'package:riverpod_skeleton/ui/preference_page.dart';
import 'package:riverpod_skeleton/ui/todo_page.dart';

part 'routes.g.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

// If you want to keep the statement for child pages, can also refer to StatefulShellRoute
@TypedShellRoute<RootRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<DashboardRoute>(path: '/dashboard'),
    TypedGoRoute<TheBRoute>(path: '/the_b'),
    TypedGoRoute<PreferenceRoute>(path: '/preference'),
  ]
)
class RootRoute extends ShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;
  
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return RootPage(child: navigator);
  }
}

class DashboardRoute extends GoRouteData {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashboardPage();
  }

}

class TheBRoute extends GoRouteData {
  const TheBRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TodoPage();
  }

}

class PreferenceRoute extends GoRouteData {
  const PreferenceRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PreferencePage();
  }

}