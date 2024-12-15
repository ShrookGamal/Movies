import 'package:flutter/material.dart';
import 'package:movies_app/data/api/model/popular_response/result.dart';
import 'package:movies_app/presentation/screens/home/home.dart';
import 'package:movies_app/presentation/screens/splash/splash.dart';
import 'package:movies_app/presentation/screens/tabs/home_tab/widgets/movie_details/movie_details.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String movieDetails = '/details';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const Splash());

      case home:
        return MaterialPageRoute(builder: (context) => Home());

      case movieDetails:
        {
          final Result result = settings.arguments as Result;
          return MaterialPageRoute(
              builder: (context) => MovieDetails(result: result));
        }
    }
  }
}
