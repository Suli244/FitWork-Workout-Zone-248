part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded(hm.HomeModel model) = _Loaded;
  const factory HomeState.error(String message) = _Error;
}
