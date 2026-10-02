import 'package:codetest/features/locations/domain/entities/location.dart';
import 'package:geolocator/geolocator.dart';

class LocationModel {
  final double latitude;
  final double longitude;

  const LocationModel({required this.latitude, required this.longitude});

  factory LocationModel.fromPosition(Position position) {
    return LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  // mode to entity ---

  Location toEntity() {
    return Location(latitude: latitude, longitude: longitude);
  }

  // entity to model

  factory LocationModel.fromEntity(Location location) {
    return LocationModel(
      latitude: location.latitude,
      longitude: location.longitude,
    );
  }
}
