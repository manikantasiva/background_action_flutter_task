import 'package:codetest/features/locations/domain/entities/location.dart';

abstract class LocationRepository {
  Future<Location> getCutrrentLocation();
}
