import 'package:codetest/features/locations/domain/usecases/get_location.dart';
import 'package:codetest/features/locations/presentation/bloc/location_event.dart';
import 'package:codetest/features/locations/presentation/bloc/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocation getLocation;

  LocationBloc({required this.getLocation}) : super(LocationInitial()) {
    on<GetLocationEvent>(_onOnGetLocation);
  }

  Future<void> _onOnGetLocation(
    GetLocationEvent event,
    Emitter<LocationState> emit,
  ) async {
    emit(Locationoading());

    try {
      final location = await getLocation();
      emit(LocationSuccess(currentLocation: location));
    } catch (e) {
      emit(LocationFailure(error: e.toString()));
    }
  }
}
