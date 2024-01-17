import 'package:batch4/WeatherApp/Common/geo_coding_helper.dart';
import 'package:batch4/WeatherApp/Common/location_picker_hanlder.dart';
import 'package:batch4/WeatherApp/Home/Model/weather_moderl.dart';
import 'package:batch4/WeatherApp/Home/Service/home_service.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomeViewModel extends GetxController {
  Rx<LatLng> myCurrentLocation = LatLng(0.0, 0.0).obs;
  RxString myAddress = "".obs;

  fetchCurrentLocation() async {
    myCurrentLocation.value = await LocationHelper.determinePosition();
    if (myCurrentLocation.value.latitude != 0.0) {
      await getMyAddress();
      await getTodayWeather();
    }
  }

  getMyAddress() async {
    myAddress.value = await GeoCodingHelper.getLocationAddressFromLatLng(
        myCurrentLocation.value);
  }

  /////Weather Data
  Rx<WeatherModel> todayData = WeatherModel.fromJson({}).obs;
  getTodayWeather() async {
    todayData.value = await HomeService.fetchTodayWeatherService(
        myCurrentLocation.value.latitude, myCurrentLocation.value.longitude);
  }

  ///
}
