import 'package:flutter/material.dart';
import 'package:hi_riveroid/utils/router/router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HiRiverpodApplication extends ConsumerWidget {
  const HiRiverpodApplication({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Hi Riverpod',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }

}