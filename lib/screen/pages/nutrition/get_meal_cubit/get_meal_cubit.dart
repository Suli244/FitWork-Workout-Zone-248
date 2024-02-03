import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workout_zone_248/screen/pages/nutrition/food_model/food_model.dart';

part 'get_meal_cubit.freezed.dart';
part 'get_meal_state.dart';

class GetMealCubit extends Cubit<GetMealState> {
  GetMealCubit() : super(const GetMealState.loading()) {
    getMeal();
  }

  final dio = Dio();
  final foodUrl =
      'https://fitwork--workout-zone-248-default-rtdb.firebaseio.com/foood.json?auth=AIzaSyAYw5jsA7kGKbUIPlelRSzbZxq31MaXti8';

  Future<void> getMeal() async {
    emit(const GetMealState.loading());
    try {
      final foodResult = await dio.get(foodUrl);
      final model =
          foodResult.data.map<MealModel>((e) => MealModel.fromJson(e)).toList();
      emit(GetMealState.success(model));
    } catch (e) {
      emit(GetMealState.error(e.toString()));
    }
  }
}
