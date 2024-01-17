import 'dart:convert';

import 'package:batch4/WeatherApp/Constant/app_keys.dart';
import 'package:batch4/WeatherApp/Home/Model/weather_moderl.dart';
import 'package:batch4/WeatherApp/Network/apis_keys.dart';
import 'package:http/http.dart' as http;

class HomeService {
  static Future<WeatherModel> fetchTodayWeatherService(
      double lat, double lng) async {
    WeatherModel data = WeatherModel.fromJson({});

    http.Response response = await http.get(Uri.parse(
        "${ApisURL.baseURL}/2.5/weather?lat=${lat}&lon=${lng}&appid=${AppKeys.appid}&units=metric"));
    if (response.statusCode == 200 || response.statusCode == 201) {
      data = WeatherModel.fromJson(jsonDecode(response.body));
      print("data");
      print(data.visibility);
    }
    return data;
  }
}
