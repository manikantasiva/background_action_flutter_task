import 'package:codetest/core/services/background_service.dart';
import 'package:codetest/features/locations/presentation/bloc/location_bloc.dart';
import 'package:codetest/features/locations/presentation/bloc/location_event.dart';
import 'package:codetest/features/locations/presentation/bloc/location_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loction Svreen')),

      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state is LocationInitial) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Get current location
                  ElevatedButton(
                    onPressed: () {
                      context.read<LocationBloc>().add(GetLocationEvent());
                    },
                    child: const Text('Get Coordinates'),
                  ),

                  const SizedBox(height: 20),

                  //  5-minute background service
                  ElevatedButton(
                    onPressed: () async {
                      await BackgroundService.start();
                    },
                    child: const Text('Start Location fETCHING'),
                  ),
                ],
              ),
            );
          }

          if (state is Locationoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is LocationSuccess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Latitude: '
                    '${state.currentLocation.latitude}',
                  ),

                  const SizedBox(height: 10),

                  Text(
                    'Longitude: '
                    '${state.currentLocation.longitude}',
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: () async {
                      await BackgroundService.start();
                    },
                    child: const Text('Start Fetching'),
                  ),
                ],
              ),
            );
          }

          if (state is LocationFailure) {
            return Center(child: Text(state.error));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
