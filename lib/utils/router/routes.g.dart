// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $loginRoute,
      $homeRoute,
    ];

RouteBase get $loginRoute => GoRouteData.$route(
      path: '/login',
      factory: $LoginRouteExtension._fromState,
    );

extension $LoginRouteExtension on LoginRoute {
  static LoginRoute _fromState(GoRouterState state) => LoginRoute();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homeRoute => ShellRouteData.$route(
      navigatorKey: HomeRoute.$navigatorKey,
      factory: $HomeRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/dashboard',
          factory: $DashboardRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/the_b',
          factory: $TheBRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/preference',
          factory: $PreferenceRouteExtension._fromState,
        ),
      ],
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();
}

extension $DashboardRouteExtension on DashboardRoute {
  static DashboardRoute _fromState(GoRouterState state) =>
      const DashboardRoute();

  String get location => GoRouteData.$location(
        '/dashboard',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TheBRouteExtension on TheBRoute {
  static TheBRoute _fromState(GoRouterState state) => const TheBRoute();

  String get location => GoRouteData.$location(
        '/the_b',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PreferenceRouteExtension on PreferenceRoute {
  static PreferenceRoute _fromState(GoRouterState state) =>
      const PreferenceRoute();

  String get location => GoRouteData.$location(
        '/preference',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
