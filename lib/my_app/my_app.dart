import 'package:flutter/material.dart';

import '../core/utils/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RoutesManager.router,
      initialRoute: RoutesManager.splash,
      debugShowCheckedModeBanner: false,
    );
  }
}
