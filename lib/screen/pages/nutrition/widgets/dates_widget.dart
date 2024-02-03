import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_zone_248/utils/images/app_images.dart';

List<List<int>> generateWeeksInMonth() {
  DateTime now = DateTime.now();
  int year = now.year;
  int month = now.month;

  DateTime firstDayOfMonth = DateTime(year, month, 1);
  DateTime lastDayOfMonth = DateTime(year, month + 1, 0);

  List<List<int>> weeksInMonth = [];

  // Разбиваем дни месяца на недели
  for (int i = 0; i < lastDayOfMonth.day; i += 7) {
    DateTime startOfWeek = firstDayOfMonth.add(Duration(days: i));
    DateTime endOfWeek = startOfWeek.add(const Duration(days: 6));
    endOfWeek = endOfWeek.isAfter(lastDayOfMonth) ? lastDayOfMonth : endOfWeek;

    List<int> weekDays = [];

    for (DateTime day = startOfWeek;
        day.isBefore(endOfWeek.add(const Duration(days: 1)));
        day = day.add(const Duration(days: 1))) {
      weekDays.add(day.day);
    }

    weeksInMonth.add(weekDays);
  }

  return weeksInMonth;
}

class DatesWidget extends StatefulWidget {
  const DatesWidget({super.key, required this.onSelectDate});

  final Function(int selectedDate) onSelectDate;

  @override
  State<DatesWidget> createState() => _DatesWidgetState();
}

class _DatesWidgetState extends State<DatesWidget> {
  final weeksInMonth = generateWeeksInMonth();
  int currantIndex = 0;
  late List<int> week = weeksInMonth[currantIndex];

  int nowDate = DateTime.now().day;

  @override
  Widget build(BuildContext context) {
    week = weeksInMonth[currantIndex];
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (currantIndex != 0) {
              currantIndex--;
              setState(() {});
            }
          },
          child: RotatedBox(
            quarterTurns: 1,
            child: Image.asset(
              AppImages.arrowDownIcon,
              height: 24.h,
              color: const Color(0xff706B6A),
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: week
                .map<Widget>(
                  (e) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            nowDate = e;
                          });
                          widget.onSelectDate(e);
                        },
                        child: Container(
                          padding: const EdgeInsetsDirectional.symmetric(
                            vertical: 20,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: nowDate == e
                                ? const Color(0xff590085)
                                : const Color(0xffF1F1F1),
                          ),
                          child: FittedBox(
                            child: Text(
                              e.toString(),
                              style: TextStyle(
                                fontSize: 15.h,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Nunito',
                                color: nowDate == e
                                    ? Colors.white
                                    : const Color(0xff706B6A),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        InkWell(
          onTap: () {
            if (currantIndex != weeksInMonth.length - 1) {
              currantIndex++;
              setState(() {});
            }
          },
          child: Image.asset(
            AppImages.arrowRightIcon,
            height: 24.h,
            color: const Color(0xff706B6A),
          ),
        ),
      ],
    );
  }
}
