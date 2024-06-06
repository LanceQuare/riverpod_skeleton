import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_skeleton/utils/router/routes.dart';

part 'root_controller.g.dart';

@riverpod
class RootController extends _$RootController {
  @override
  int build() => 0;

  setCurrentIndex(int index) {
    state = index;
  }

  onBottomNavigationTap(BuildContext context, int index) {
    state = index;
    switch (index) {
      case 0:
        context.go(const DashboardRoute().location);
        break;
      case 1:
        context.go(const TodoRoute().location);
        break;
      case 2:
        context.go(const PreferenceRoute().location);
        break;
    }
  }
}