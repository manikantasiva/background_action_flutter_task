import 'package:codetest/features/locations/domain/entities/location.dart';
import 'package:codetest/features/locations/domain/repositories/location_repository.dart';

class GetLocation {
  final LocationRepository repository;

  GetLocation({required this.repository});

  Future<Location> call() async {
    return repository.getCutrrentLocation();
  }
}
