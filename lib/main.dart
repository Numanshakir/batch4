import 'package:batch4/FirebaseWork/login_view.dart';
import 'package:batch4/Localization/demo_splash.dart';
import 'package:batch4/Localization/demo_view.dart';
import 'package:batch4/Localization/translation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:permission_handler/permission_handler.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  print("FCM ${await messaging.getToken()}");
// The following line will enable the Android and iOS wakelock.
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    debugPrint('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    debugPrint('User granted provisional permission');
  } else {
    debugPrint('User declined or has not accepted permission');
  }
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((event) {
    print("onMessage");
    print(event.notification!.title);
    print(event.notification!.body);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print("onMessageOpenedApp");
    print(event.notification!.title);
    print(event.notification!.body);
  });
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