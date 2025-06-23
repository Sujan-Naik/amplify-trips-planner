import 'dart:async';

import 'package:amplify_trips_planner/features/trip/data/trips_repository.dart';
import 'package:amplify_trips_planner/models/ModelProvider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'past_trips_list_controller.g.dart';

@riverpod
class PastTripsListController extends _$PastTripsListController {
  Future<List<Trip>> _fetchTrips() async {
    final tripsRepository = ref.read(tripsRepositoryProvider);
    final trips = await tripsRepository.getPastTrips();
    return trips;
  }

  @override
  FutureOr<List<Trip>> build() async {
    return _fetchTrips();
  }
}