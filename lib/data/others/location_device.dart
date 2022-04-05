import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationDevice {
  Future<bool> checkLocationServices() async {
    bool serviceEnabled;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    return serviceEnabled;
  }

  Future<LocationPermission> checkLocationPermission() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    }

    return permission;
  }

  // Future<Position> determinePosition() async {
  Future<Map<String, dynamic>> determinePosition() async {
    Map<String, dynamic> result = new Map<String, dynamic>();
    await checkLocationServices();
    await checkLocationPermission();

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final cityName = await getCityName(position);
    result['position'] = position;
    result['cityName'] = cityName;

    return result;
  }

  Future<String?> getCityName(Position position) async {
    try {
      List<Placemark> placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      return placemark[0].name ?? 'Lokasi Tidak Diketahui';
      // return city;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
