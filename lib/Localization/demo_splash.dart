import 'package:batch4/Localization/demo_view.dart';
import 'package:batch4/WeatherApp/Home/View/home_view.dart';
import 'package:batch4/WeatherApp/Routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DemoSplashView extends StatefulWidget {
  const DemoSplashView({super.key});

  @override
  State<DemoSplashView> createState() => _DemoSplashViewState();
}

class _DemoSplashViewState extends State<DemoSplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkCurrentLanguage();
    Future.delayed(Duration(seconds: 3), () {
      // Navigator.pushAndRemoveUntil(
      //     context,
      //     MaterialPageRoute(builder: (context) => HomeView()),
      //     (Route<dynamic> route) => false);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DemoView()));
    });
  }

  checkCurrentLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? lang = prefs.getString("locale");
    print("lang ${lang}");
    if (lang != null) {
      if (lang == "ar") {
        Get.updateLocale(Locale("ar", "AE"));
      } else {
        Get.updateLocale(Locale("en", "US"));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text("Weather App"),
        ),
      ),
    );
  }
}
