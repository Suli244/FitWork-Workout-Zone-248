import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_zone_248/screen/pages/home/timer_cubit/timer_cubit.dart';

class TimerText extends StatelessWidget {
  const TimerText({this.title, super.key, this.complete});
  final String? title;
  final Function? complete;

  @override
  Widget build(BuildContext context) {
    final duration = context.select(
      (TimerCubit cubit) => cubit.state.map(
          runInProgress: (value) => value.duration,
          runComplete: complete != null
              ? (value) {
                  complete!();
                  return 0;
                }
              : (value) => 0,
          initial: (value) => value.duration),
    );
    final hoursStr =
        ((duration / 60 / 60) % 24).floor().toString().padLeft(2, '0');
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).floor().toString().padLeft(2, '0');

    return Text(
      hoursStr == '00'
          ? '$minutesStr:$secondsStr'
          : '$hoursStr:$minutesStr:$secondsStr',
      style: const TextStyle(
          fontSize: 19, fontWeight: FontWeight.w500, color: Color(0xff706B6A)),
    );
  }
}
