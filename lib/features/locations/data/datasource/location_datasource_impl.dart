import 'package:codetest/features/locations/data/datasource/location_datasource.dart';
import 'package:codetest/features/locations/data/model/location_model.dart';
import 'package:geolocator/geolocator.dart';

class LocationDatasourceImpl implements LocationDatasource {
  @override
  Future<LocationModel> getCurrentLocation() async {
    // =====--->location service
    final isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      throw Exception('Location service is disabled');
    }

    ///// Check permssions
    LocationPermission permission = await Geolocator.checkPermission();
    //// denioed
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      throw Exception('Location permission denied');
    }

    // 5. Permanently denied
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission permanently denied');
    }

    // 6. Get current position
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // 7. Convert Position → LocationModel
    return LocationModel.fromPosition(position);
  }
}
