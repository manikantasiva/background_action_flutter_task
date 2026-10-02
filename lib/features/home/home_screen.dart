import 'package:codetest/features/locations/data/datasource/location_datasource_impl.dart';
import 'package:codetest/features/locations/data/repository/location_repository_impl.dart';
import 'package:codetest/features/locations/domain/usecases/get_location.dart';
import 'package:codetest/features/locations/presentation/bloc/location_bloc.dart';
import 'package:codetest/features/locations/presentation/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Home"),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      final datasource = LocationDatasourceImpl();

                      final repository = LocationRepositoryImpl(
                        datasource: datasource,
                      );

                      final getLocation = GetLocation(repository: repository);

                      return BlocProvider(
                        create: (_) => LocationBloc(getLocation: getLocation),
                        child: const LocationScreen(),
                      );
                    },
                  ),
                );
              },
              child: Text("got Locations ->"),
            ),
          ],
        ),
      ),
    );
  }
}
