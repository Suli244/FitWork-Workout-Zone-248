import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_state.dart';
part 'timer_cubit.freezed.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerState.initial(0));
  final Ticker _ticker;
  int duration = 0;

  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();

    return super.close();
  }

  void onStarted({int? newDuration}) {
    emit(TimerState.runInProgress(newDuration ?? duration));
    _tickerSubscription?.cancel();

    print('111111111');
    _tickerSubscription = _ticker
        .tick(ticks: newDuration ?? duration)
        .listen((duration) => _onTicked(duration));
  }

  void _onTicked(int duration) {
    this.duration = duration;
    print('1111111113 $duration');
    emit(
        // duration > 0
        //     ?
        TimerState.runInProgress(duration)
        // : const TimerState.runComplete(),
        );
  }
}

class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    print('111111111');
    return Stream.periodic(const Duration(seconds: 1), (x) {
      print('1111111112 ${x + 1}');
      return ticks + x + 1;
    });
  }
}
