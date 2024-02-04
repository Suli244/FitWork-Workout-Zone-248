part of 'timer_cubit.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState.initial(int duration) = _TimerInitialState;
  const factory TimerState.runInProgress(int duration) =
      _TimerRunInProgressState;
  const factory TimerState.runComplete() = _TimerRunCompleteState;
}
