import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hi_riveroid/controllers/app_controller.dart';
import 'package:hi_riveroid/utils/router/routes.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');
  final isAuth = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());
  ref
    ..onDispose(isAuth.dispose)
    ..listen(
        appControllerProvider.select((value) => value.whenData((value)=> value?.token?.isNotEmpty ?? false)),
        (_, next) {
          isAuth.value = next;
        }
    );

  final router = GoRouter(
    navigatorKey: routerKey,
    refreshListenable: isAuth,
    debugLogDiagnostics: true,
    initialLocation: DashboardRoute().location,
    redirect: (context, state) {
      if (isAuth.value.unwrapPrevious().hasError) return LoginRoute().location;
      if (isAuth.value.isLoading || !isAuth.value.hasValue) return DashboardRoute().location;
      final auth = isAuth.value.requireValue;
      return auth ? null : LoginRoute().location;
    },
    routes: $appRoutes,
  );
  ref.onDispose(router.dispose); // always clean up after yourselves
  return router;
}