import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_skeleton/controllers/root_controller.dart';

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedIndex = ref.watch(rootControllerProvider);
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (int index) => ref.read(rootControllerProvider.notifier).onBottomNavigationTap(context, index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Todos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}