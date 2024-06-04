import 'package:flutter/material.dart';
import 'package:riverpod_skeleton/ui/widget/bottom_navigation.dart';

class TheBPage extends StatelessWidget {
  const TheBPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The B Page'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Hi Riverpod!',
            ),
          ],
        ),
      ),
    );
  }
}