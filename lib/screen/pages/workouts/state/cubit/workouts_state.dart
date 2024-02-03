part of 'workouts_cubit.dart';

@freezed
class WorkoutsState with _$WorkoutsState {
  const factory WorkoutsState.initial() = _Initial;
  const factory WorkoutsState.loading() = _Loading;
  const factory WorkoutsState.success({required List<Workouts> models, required bool search}) = Success;
  const factory WorkoutsState.searched({required List<Workouts> models}) = Searched;
  const factory WorkoutsState.error(dynamic e) = _Error;
}
