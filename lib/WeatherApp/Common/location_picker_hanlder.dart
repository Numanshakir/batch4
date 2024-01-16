import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class LocationHelper {
  static Future<LatLng> determinePosition() async {
    LatLng location = LatLng(0.0, 0.0);
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // return Future.error('Location services are disabled.');
      return location;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // return Future.error('Location permissions are denied');
        return location;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // return Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
        return location;

    }

    Position position = await Geolocator.getCurrentPosition();
    location = LatLng(position.latitude, position.longitude);
    return location;
  }
}
