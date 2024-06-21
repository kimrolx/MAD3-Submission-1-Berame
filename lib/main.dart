import 'package:flutter/material.dart';

import 'src/controllers/auth_controller.dart';
import 'src/routes/router.dart';

void main() async {
  AuthController.initialize();
  GlobalRouter.initialize();
  await AuthController.I.loadSession();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: GlobalRouter.I.router,
      title: 'MAD3 Submission',
    );
  }
}
