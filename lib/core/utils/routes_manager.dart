import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/presentation/screens/home/home.dart';
import 'package:movies_app/presentation/screens/splash/splash.dart';
import 'package:movies_app/presentation/screens/tabs/home_tab/widgets/popular/widget/MovieDetails.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String MovieDetails = '/home';



  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => Splash());

      case home:
        return MaterialPageRoute(builder: (context) => Home());
        case MovieDetails:
    return MaterialPageRoute(builder: (context) => Moviedetails());
    }

  }

  }

