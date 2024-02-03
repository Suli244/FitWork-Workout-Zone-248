part of 'get_meal_cubit.dart';

@freezed
class GetMealState with _$GetMealState {
  const factory GetMealState.loading() = _Loading;
  const factory GetMealState.error(String error) = _Error;
  const factory GetMealState.success(List<MealModel> model) = _Success;
}
