import 'package:batch4/WeatherApp/Home/View/home_view.dart';
import 'package:batch4/WeatherApp/Routes/route_names.dart';
import 'package:batch4/WeatherApp/Splash/View/splash_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> genrateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashView:
        {
          return MaterialPageRoute(builder: (context) => SplashView());
        }
      case RouteNames.homeView:
        {
          return MaterialPageRoute(builder: (context) => HomeView());
        }

      default:
        {
          return MaterialPageRoute(
              builder: ((context) => Scaffold(
                    body: Container(
                      child: Center(
                        child: Text("No Route"),
                      ),
                    ),
                  )));
        }
    }
  }
}
