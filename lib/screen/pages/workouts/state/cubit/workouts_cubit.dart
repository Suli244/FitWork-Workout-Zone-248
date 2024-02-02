import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workout_zone_248/screen/pages/workouts/state/models/workouts_model.dart';
import 'package:workout_zone_248/utils/urls.dart';

part 'workouts_cubit.freezed.dart';
part 'workouts_state.dart';

class WorkoutsCubit extends Cubit<WorkoutsState> {
  WorkoutsCubit() : super(const WorkoutsState.initial());
  final dio = Dio();

  List<Workouts> workoutsSearch = [];
  Future getData() async {
    emit(const WorkoutsState.loading());
    try {
      final result = await dio.get(fbUrl('worouts'));
      log('data: result: $result ');
      final listModel = result.data
          .map<Workouts>(
            (e) => Workouts.fromJson(e),
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
    emit(const WorkoutsState.loading());
    try {
      List<Workouts> newList = List<Workouts>.from(workoutsSearch);
      newList.removeWhere(
        (e) => !e.title.toLowerCase().contains(
              text.toLowerCase(),
            ),
      );
      emit(
        WorkoutsState.success(
          models: newList,
          search: text.isNotEmpty,
        ),
      );
    } catch (e) {
      emit(WorkoutsState.error(e.toString()));
    }
  }
}
