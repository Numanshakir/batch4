import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DemoView extends StatelessWidget {
  const DemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Localization".tr)),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text("This is English Word".tr), Icon(Icons.email)],
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: Colors.amber,
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();

                prefs.setString("locale", "en");

                Get.updateLocale(Locale("en", "US"));
              },
              child: Text("English"),
            ),
            MaterialButton(
              color: Colors.amber,
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();

                prefs.setString("locale", "ar");
                Get.updateLocale(Locale("ar", "AE"));
              },
              child: Text("Arabic"),
            ),
          ],
        ),
      ),
    );
  }
}
