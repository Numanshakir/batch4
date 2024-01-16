import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class GeoCodingHelper {
  static Future<String> getLocationAddressFromLatLng(LatLng latLng) async {
    String addres = "";

    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    addres =
        "${placemarks.first.administrativeArea},${placemarks.first.country}";
    return addres;
  }
}
