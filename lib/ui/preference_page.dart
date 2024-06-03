import 'package:flutter/material.dart';
import 'package:hi_riveroid/ui/widget/bottom_navigation.dart';

class PreferencePage extends StatelessWidget {
  const PreferencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Preferences'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}