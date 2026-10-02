




import 'package:codetest/features/locations/domain/entities/location.dart';

abstract  class LocationState {}

  class LocationInitial extends LocationState {}

    class Locationoading extends LocationState {}


      class LocationSuccess extends LocationState {
        final Location currentLocation;

        LocationSuccess({
          required this.currentLocation
        });
      }


       class LocationFailure extends LocationState {
        final String error;

        LocationFailure({
          required this.error
        });
      }