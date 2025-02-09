import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stacktrace) async {
      await Geolocator.requestPermission();
    });

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }
}
