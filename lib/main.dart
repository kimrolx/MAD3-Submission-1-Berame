import 'package:flutter/material.dart';

import 'src/routes/router.dart';

void main() {
  GlobalRouter.initialize();

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
