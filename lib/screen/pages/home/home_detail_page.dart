import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:native_ios_dialog/native_ios_dialog.dart';
import 'package:workout_zone_248/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:workout_zone_248/screen/pages/home/models/home_model.dart';
import 'package:workout_zone_248/screen/pages/home/models/home_model.dart';
import 'package:workout_zone_248/screen/pages/home/timer_cubit/timer_cubit.dart';
import 'package:workout_zone_248/screen/pages/home/timer_text.dart';

class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({
    super.key,
    required this.trainModel,
    required this.index,
  });
  final Trainings trainModel;
  final int index;

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  bool timer = false;
  final _timerCubit = TimerCubit(ticker: const Ticker());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<TimerCubit>(
        create: (context) => _timerCubit..onStarted(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.sp),
                      topRight: Radius.circular(32.sp),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.h),
                        Container(
                          width: 80.h,
                          height: 4.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: const Color(0xff706B6A),
                          ),
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ),
              ),
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30.sp,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      widget.trainModel.title,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.white,
              expandedHeight: MediaQuery.of(context).size.height / 2.5.h,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Image.network(
                      widget.trainModel.image,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2.h + 20,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.trainModel.title,
                      style: TextStyle(
                        fontSize: 26.h,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${widget.trainModel.minutes} min • ${widget.trainModel.calories} kcal • ${widget.trainModel.level}',
                      style: TextStyle(
                        fontSize: 15.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      widget.trainModel.description,
                      style: TextStyle(
                        fontSize: 15.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        if (timer)
                          Expanded(
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                      width: 2,
                                      color: const Color(0xff706B6A))),
                              child: const Center(child: TimerText()),
                            ),
                          ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              if (!timer) {
                                setState(() {
                                  timer = !timer;
                                });
                              } else {
                                int targetSeconds =
                                    (widget.trainModel.minutes * 60 * 0.7)
                                        .round();
                                final minutesStr =
                                    ((_timerCubit.duration / 60) % 60)
                                        .floor()
                                        .toString()
                                        .padLeft(2, '0');
                                final secondsStr = (_timerCubit.duration % 60)
                                    .floor()
                                    .toString()
                                    .padLeft(2, '0');
                                if (_timerCubit.duration < targetSeconds) {
                                  NativeIosDialog(
                                      title:
                                          "You finished you workout quickly!",
                                      message:
                                          "You've exercised: $minutesStr:$secondsStr min. Time needed for training: ${widget.trainModel.minutes}:00 min",
                                      actions: [
                                        NativeIosDialogAction(
                                            text: "Repeat",
                                            style: NativeIosDialogActionStyle
                                                .cancel,
                                            onPressed: () {
                                              _timerCubit.onStarted(
                                                  newDuration: 0);
                                            }),
                                        NativeIosDialogAction(
                                            text: "Cancel",
                                            style: NativeIosDialogActionStyle
                                                .defaultStyle,
                                            onPressed: () {
                                              // Navigator.pop(context);
                                            }),
                                      ]).show();
                                } else {
                                  int targetSeconds2 =
                                      (widget.trainModel.minutes * 60 * 1.3)
                                          .round();
                                  if (_timerCubit.duration > targetSeconds2) {
                                    NativeIosDialog(
                                        title:
                                            "You've been practicing too long, try to stick to the time so you don't get too exhausted!",
                                        message:
                                            "You've exercised: $minutesStr:$secondsStr min. Time needed for training: ${widget.trainModel.minutes}:00 min",
                                        actions: [
                                          NativeIosDialogAction(
                                              text: "Okay",
                                              style: NativeIosDialogActionStyle
                                                  .cancel,
                                              onPressed: () {
                                                _saveData();
                                                // _timerCubit.onStarted(
                                                //     newDuration: 0);
                                              }),
                                          NativeIosDialogAction(
                                              text: "Cancel",
                                              style: NativeIosDialogActionStyle
                                                  .defaultStyle,
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              }),
                                        ]).show();
                                  } else {
                                    NativeIosDialog(
                                        title:
                                            "You have successfully completed the training!",
                                        message:
                                            "You've exercised: $minutesStr:$secondsStr min. Time needed for training: ${widget.trainModel.minutes}:00 min",
                                        style: NativeIosDialogStyle.alert,
                                        actions: [
                                          NativeIosDialogAction(
                                              text: "Okay",
                                              style: NativeIosDialogActionStyle
                                                  .cancel,
                                              onPressed: () {
                                                _saveData();
                                              }),
                                        ]).show();
                                  }
                                }
                              }
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: const Color(0xff590085)),
                              child: Center(
                                  child: Text(
                                timer ? 'Finish' : 'Start training',
                                style: const TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _saveData() async {
    Box<HomeModel>? dB;
    if (Hive.isBoxOpen('home')) {
      dB = Hive.box('home');
    } else {
      dB = await Hive.openBox('home');
    }
    final cacheData = dB.get('home');
    cacheData?.workouts[widget.index].isComplete = true;
    cacheData?.calories += cacheData.workouts[widget.index].calories;
    cacheData?.activeMinutes += cacheData.workouts[widget.index].minutes;
    cacheData?.save();
    dB.put('home', cacheData!);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavigatorScreen()),
        (route) => false);
  }
}
