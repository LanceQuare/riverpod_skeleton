import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hi_riveroid/ui/dashboard_page.dart';
import 'package:hi_riveroid/ui/home_page.dart';
import 'package:hi_riveroid/ui/login_page.dart';
import 'package:hi_riveroid/ui/preference_page.dart';
import 'package:hi_riveroid/ui/the_b_page.dart';

part 'routes.g.dart';

final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@TypedShellRoute<HomeRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<DashboardRoute>(path: '/dashboard'),
    TypedGoRoute<TheBRoute>(path: '/the_b'),
    TypedGoRoute<PreferenceRoute>(path: '/preference'),
  ]
)
class HomeRoute extends ShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  // @override
  // Widget build(BuildContext context, GoRouterState state) {
  //   //TODO: implement Shellroute
  //   //https://pub.dev/documentation/go_router/latest/topics/Configuration-topic.html
  //   return const HomePage(null);
  // }
  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return HomePage(child: navigator);
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
    return const TheBPage();
  }

}

class PreferenceRoute extends GoRouteData {
  const PreferenceRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PreferencePage();
  }

}