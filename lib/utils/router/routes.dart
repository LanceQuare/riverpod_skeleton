import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hi_riveroid/ui/home_page.dart';
import 'package:hi_riveroid/ui/login_page.dart';

part 'routes.g.dart';

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}