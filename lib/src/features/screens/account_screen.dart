import 'package:flutter/material.dart';

import '../../routes/router.dart';
import 'counter_screen.dart';

class AccountScreen extends StatelessWidget {
  static const String route = '/';
  static const String path = "/account";
  static const String name = "Account Name";
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Account Screen"),
            ElevatedButton(
              onPressed: () {
                GlobalRouter.I.router.push(CounterScreen.path);
              },
              child: const Text("Go to Counter Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
