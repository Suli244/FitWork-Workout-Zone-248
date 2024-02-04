import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pedometer/pedometer.dart';
import 'package:workout_zone_248/screen/pages/home/models/home_model.dart'
    as hm;
import 'package:workout_zone_248/screen/pages/workouts/state/models/workouts_model.dart';
import 'package:workout_zone_248/utils/urls.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

const _key = 'home';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.loading());

  final dio = Dio();
  int _stepCount = 0;

  Future getData() async {
    emit(const HomeState.loading());
    try {
      Box<hm.HomeModel>? dB;
      if (Hive.isBoxOpen(_key)) {
        dB = Hive.box(_key);
      } else {
        dB = await Hive.openBox(_key);
      }
      final cacheData = dB.get(_key);
      DateTime date = DateTime.now();
      if (cacheData != null) {
        if (cacheData.day == date.day) {
          cacheData.steps += _stepCount;
          cacheData.km += (_stepCount / 1000).floor();
          cacheData.save();
          dB.put(_key, cacheData);
          emit(
            HomeState.loaded(
              cacheData,
            ),
          );
          return Future.value();
        } else {
          dB.clear();
        }
      }
      _initPedometer();
      final result = await dio.get(fbUrl('worouts'));
      final listModel = result.data
          .map<Workouts>(
            (e) => Workouts.fromJson(
              e,
              result.data.indexOf(e) < 2,
            ),
          )
          .toList();
      List<hm.Trainings> list = [];
      List<Workouts> shuffledList = List.from(listModel)..shuffle();
      for (var element in shuffledList[0].trainings) {
        list.add(hm.Trainings.fromModle(element));
      }

      final data = hm.HomeModel(
          day: date.day,
          calories: 0,
          km: 0,
          steps: 0,
          activeMinutes: 0,
          workouts: list);
      data.steps += _stepCount;
      data.km += (_stepCount / 1000).floor();
      data.save();
      await dB.put(_key, data);
      emit(
        HomeState.loaded(
          data,
        ),
      );
    } catch (e) {
      emit(HomeState.error(e.toString()));
    }
  }

  final Stream<StepCount> _stepCountStream = Pedometer.stepCountStream;

  void _initPedometer() async {
    // Listen to streams and handle errors
    _stepCountStream.listen(onStepCount);
  }

  void onStepCount(StepCount event) {
    _stepCount = event.steps;
    print(_stepCount);
  }
}
