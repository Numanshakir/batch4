import 'package:batch4/WeatherApp/Common/geo_coding_helper.dart';
import 'package:batch4/WeatherApp/Common/location_picker_hanlder.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomeViewModel extends GetxController {
  Rx<LatLng> myCurrentLocation = LatLng(0.0, 0.0).obs;
  RxString myAddress = "".obs;

  fetchCurrentLocation() async {
    myCurrentLocation.value = await LocationHelper.determinePosition();
    if (myCurrentLocation.value.latitude != 0.0) {
      await getMyAddress();
    }
  }

  getMyAddress() async {
    myAddress.value = await GeoCodingHelper.getLocationAddressFromLatLng(
        myCurrentLocation.value);
  }
}
