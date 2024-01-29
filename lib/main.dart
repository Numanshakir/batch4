import 'package:batch4/FirebaseWork/login_view.dart';
import 'package:batch4/Localization/demo_splash.dart';
import 'package:batch4/Localization/demo_view.dart';
import 'package:batch4/Localization/translation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslation(),
      supportedLocales: const [
        Locale("en", "US"), // English, no country code
        Locale("ar", "AE"), // Spanish, no country code
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Get.deviceLocale,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const DemoSplashView(),
    );
  }
}

// import 'package:batch4/AlbumApp/View/albums_view.dart';
// import 'package:batch4/App/Splash/View/layout_design.dart';
// import 'package:batch4/App/Splash/View/splash_screen.dart';
// import 'package:batch4/WeatherApp/Home/View/home_view.dart';
// import 'package:batch4/WeatherApp/Routes/route_names.dart';
// import 'package:batch4/WeatherApp/Routes/routes.dart';
// import 'package:batch4/WeatherApp/Splash/View/splash_view.dart';
// import 'package:flutter/material.dart';

// main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       title: "Batch 4",
//       home: HomeView(),
//       // initialRoute: RouteNames.splashView,
//       // onGenerateRoute: AppRoutes.genrateRoutes,
//     );
//   }
// }

// /////APIS Request
// ///CRUD
// ///GET
// ///POST
// ///PUT
// ///PATCH
// ///DELETE
// ///