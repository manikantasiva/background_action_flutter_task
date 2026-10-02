


import 'package:codetest/features/locations/data/model/location_model.dart';
import 'package:codetest/features/locations/domain/entities/location.dart';

abstract class LocationDatasource {
  Future<LocationModel> getCurrentLocation();
}