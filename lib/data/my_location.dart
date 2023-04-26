
import 'package:geolocator/geolocator.dart';


class MyLocation {
  double latitude2 = 0.0;
  double longitude2 = 0.0;

  Future<void> getMyCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      latitude2 = position.latitude;
      longitude2 = position.longitude;

      print('--------- position : $position');
      print('--------- latitude2 : $latitude2');
      print('--------- longitude2 : $longitude2');
    } catch (e) {
      print('네트웍이 불안정합니다.');
    }

  }
}
