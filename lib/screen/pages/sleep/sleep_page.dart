import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:workout_zone_248/screen/pages/nutrition/widgets/dates_widget.dart';
import 'package:workout_zone_248/screen/pages/nutrition/widgets/motivation_container.dart';
import 'package:workout_zone_248/screen/pages/sleep/model/sleep_model.dart';
import 'package:workout_zone_248/screen/pages/sleep/select_time.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key});

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  ModelXMan? modelTimer;
  final dateTime = DateTime.now();
  int nowDate = 0;

  @override
  void initState() {
    super.initState();
    final date = DateFormat('d').format(dateTime);
    getByDay(int.parse(date));
  }

  getByDay(int date) async {
    var sleeps = await Hive.openBox<ModelXMan>('timeX');
    final sleepsModel = sleeps.values.toList();

    log('data: sleepsModel: $sleepsModel ');

    final modelTimerList = sleepsModel.where((e) {
      final selectedDate = e.date;
      return selectedDate == date;
    }).toList();

    log('data: modelTimerList: $modelTimerList ');

    if (modelTimerList.isNotEmpty) {
      modelTimer = modelTimerList.first;
    } else {
      modelTimer = null;
    }
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant SleepPage oldWidget) {
    getByDay(nowDate);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nutrition',
                style: TextStyle(
                  fontSize: 26.h,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Nunito',
                ),
              ),
              SizedBox(height: 32.h),
              DatesWidget(
                onSelectDate: (selectedDate) {
                  getByDay(selectedDate);
                  setState(() {});
                  log('data: selectedDate: $selectedDate ');
                },
              ),
              SizedBox(height: 15.h),
              const MotivationContainer(
                titles: [
                  'Sleep Is First',
                  'Prioritize Your Rest',
                  'Recharge Your Body',
                  'Dream, Achieve, Repeat',
                  'Mindful Slumber',
                  'Nighttime Repair',
                ],
                descs: [
                  'sleeping is one of the most necessary things for your body',
                  'Sleep is the foundation of a healthy lifestyle. Make it a priority for overall well-being.',
                  'Your body needs time to recharge. Quality sleep is the key to unlocking your full potential.',
                  'Dream big, but don"t forget to sleep well. Quality sleep fuels your ambitions for a successful day ahead.',
                  'Give your mind the rest it deserves. Mindful slumber contributes to mental clarity and focus.',
                  'While you sleep, your body undergoes essential repairs. Support this process with sufficient and quality sleep.',
                ],
              ),
              SizedBox(height: 40.h),
              const Text(
                'Today Sleeping Time',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Divider(color: Color(0xffF1F1F1)),
              // const SizedBox(height: 1),
              SizedBox(
                height: 59,
                child: Row(
                  children: [
                    FittedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              calculateTimeDifference(
                                DateFormat('HH:mm:ss').format(
                                  modelTimer?.startDate ?? DateTime.now(),
                                ),
                                DateFormat('HH:mm:ss').format(
                                  modelTimer?.endDate ?? DateTime.now(),
                                ),
                              ),
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          if (modelTimer != null)
                            Text(
                              ' ${DateFormat('HH:mm').format(
                                modelTimer!.startDate,
                              )}-${DateFormat('HH:mm').format(
                                modelTimer!.endDate,
                              )}',
                            ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectTime(),
                          ),
                        ).then((value) {
                          if (value is ModelXMan) {
                            log('data: value: $value ');
                            modelTimer = value;
                            setState(() {});
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: const Color(0xff590085),
                        ),
                        child: Text(
                          'Add',
                          style: TextStyle(
                            fontSize: 15.h,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Nunito',
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text('Sleep'),
              const Divider(color: Color(0xffF1F1F1)),
              Container(
                height: 120,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        axisNameSize: 15,
                        // axisNameWidget: Text(''),
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: defaultGetTitle,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: 11,
                    minY: 0,
                    maxY: 6,
                    lineBarsData: [
                      LineChartBarData(
                        color: const Color(0xffFB3B02),
                        spots: [
                          const FlSpot(0, 3),
                          const FlSpot(1, 2),
                          const FlSpot(2, 1),
                          const FlSpot(2, 5),
                          const FlSpot(3, 0),
                          const FlSpot(3, 2),
                          const FlSpot(4, 3),
                          const FlSpot(5, 1),
                          const FlSpot(5, 4),
                          const FlSpot(6, 1),
                          const FlSpot(6, 4),
                          const FlSpot(7, 5),
                          const FlSpot(8, 2),
                          const FlSpot(9, 5),
                          const FlSpot(10, 1),
                          const FlSpot(10, 5),
                          const FlSpot(11, 1),
                        ],
                        isCurved: true,
                        // colors: [Colors.red],
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget defaultGetTitle(double value, TitleMeta meta) {
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: FittedBox(
        child: Text(
      meta.formattedValue.padLeft(2, '0'),
    )),
  );
}

String calculateTimeDifference(String startTime, String endTime) {
  TimeOfDay startTimeOfDay = convertToTimeOfDay(startTime);
  TimeOfDay endTimeOfDay = convertToTimeOfDay(endTime);
  Duration timeDifference = calculateDuration(startTimeOfDay, endTimeOfDay);

  int hours = timeDifference.inHours;
  int minutes = timeDifference.inMinutes;

  // Avoiding negative values
  if (timeDifference.isNegative) {
    hours = 0;
    minutes = 0;
  }

  // Adjusting minutes if it's greater than 59
  if (minutes > 59) {
    hours += 1;
    minutes = minutes % 60;
  }

  // Returning formatted string
  if (hours >= 1) {
    return '$hours:${minutes.toString().padLeft(2, '0')} hours';
  } else {
    return '$minutes minutes';
  }
}

TimeOfDay convertToTimeOfDay(String timeString) {
  List<String> timeComponents = timeString.split(':');
  int hours = int.parse(timeComponents[0]);
  int minutes = int.parse(timeComponents[1]);

  return TimeOfDay(hour: hours, minute: minutes);
}

Duration calculateDuration(TimeOfDay startTime, TimeOfDay endTime) {
  DateTime startDateTime =
      DateTime(2022, 1, 1, startTime.hour, startTime.minute);
  DateTime endDateTime = DateTime(2022, 1, 1, endTime.hour, endTime.minute);

  return endDateTime.difference(startDateTime);
}
