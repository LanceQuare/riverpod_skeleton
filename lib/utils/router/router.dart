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
    ..onDispose(isAuth.dispose);
    // ..listen(
    //   appControllerProvider.select((value) => value.wh),
    //   (_, next) {
    //     isAuth.value = next;
    //   },
    // );

  final router = GoRouter(
    navigatorKey: routerKey,
    debugLogDiagnostics: true,
    initialLocation: HomeRoute().location,
    redirect: (context, state) {

    },
    routes: $appRoutes,
  );
  ref.onDispose(router.dispose); // always clean up after yourselves
  return router;
}