import 'package:codetest/features/locations/data/datasource/location_datasource.dart';
import 'package:codetest/features/locations/domain/entities/location.dart';
import 'package:codetest/features/locations/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {

  final LocationDatasource datasource;

  LocationRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Location> getCutrrentLocation() async {

    final posit =
        await datasource.getCurrentLocation();

    return posit.toEntity();
  }
}