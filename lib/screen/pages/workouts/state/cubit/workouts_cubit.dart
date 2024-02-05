import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workout_zone_248/screen/pages/workouts/state/models/workouts_model.dart';

part 'workouts_cubit.freezed.dart';
part 'workouts_state.dart';

class WorkoutsCubit extends Cubit<WorkoutsState> {
  WorkoutsCubit() : super(const WorkoutsState.initial());
  final dio = Dio();

  final fburl =
      'https://fitwork--workout-zone-248-default-rtdb.firebaseio.com/worouts.json?auth=AIzaSyAYw5jsA7kGKbUIPlelRSzbZxq31MaXti8';

  List<Workouts> workoutsSearch = [];
  List<Workouts> filterSearch = [];
  Future getData() async {
    emit(const WorkoutsState.loading());
    try {
      final result = await dio.get(fburl);
      log('data: result: $result ');
      final listModel = result.data
          .map<Workouts>(
            (e) => Workouts.fromJson(
              e,
              result.data.indexOf(e) < 2,
            ),
          )
          .toList();
      workoutsSearch.addAll(listModel);
      emit(
        WorkoutsState.success(
          models: listModel,
          search: false,
        ),
      );
    } catch (e) {
      emit(WorkoutsState.error(e));
    }
  }

  searchList(String text) {
    try {
      if (text.isNotEmpty) {
        filterSearch = workoutsSearch.where((model) {
          return model.title.toLowerCase().contains(text.toLowerCase());
        }).toList();
      } else {
        filterSearch = workoutsSearch;
      }
      emit(
        WorkoutsState.success(
          models: filterSearch,
          search: text.isNotEmpty,
        ),
      );
    } catch (e) {
      emit(WorkoutsState.error(e.toString()));
    }
  }
}
