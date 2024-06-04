import 'package:flutter/material.dart';
import 'package:hi_riveroid/controllers/login_controller.dart';
import 'package:hi_riveroid/utils/router/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login Page',
            ),
            ElevatedButton(
                onPressed: () => ref.read(loginControllerProvider.notifier).login("Lazzaro", "")
                    .then((_) => DashboardRoute().pushReplacement(context)),
                child: const Text('Login'))
          ],
        ),
      )
    );
  }
}