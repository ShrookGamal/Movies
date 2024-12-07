import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/assets_manager.dart';
import 'package:movies_app/core/utils/routes_manager.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, RoutesManager.home));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
        ),
        Image.asset(AssetsManager.splashLogo)
      ],
    );
  }
}
