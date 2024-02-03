import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_zone_248/screen/pages/nutrition/food_model/kcal_hive_model.dart';

class PercontWidget extends StatefulWidget {
  const PercontWidget({super.key, required this.date});
  final int date;

  @override
  State<PercontWidget> createState() => _PercontWidgetState();
}

class _PercontWidgetState extends State<PercontWidget> {
  int carbs = 0;
  int protain = 0;
  int fat = 0;

  int carbsHive = 0;
  int protainHive = 0;
  int fatHive = 0;

  getSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    carbs = prefs.getInt('carbs') ?? 0;
    protain = prefs.getInt('protain') ?? 0;
    fat = prefs.getInt('fat') ?? 0;
    setState(() {});
  }

  getHiveModel() async {
    var kcalBox = await Hive.openBox<KCalHiveModel>('kcal');
    final savedKCals = kcalBox.values.toList();

    final selectedDateModel = savedKCals.where((e) {
      final selectedDate = int.parse(e.date.split(' ').first);
      return selectedDate == widget.date;
    });
    if (selectedDateModel.isNotEmpty) {
      carbsHive = selectedDateModel.first.carbs;
      protainHive = selectedDateModel.first.protein;
      fatHive = selectedDateModel.first.fats;
      setState(() {});
    } else {
      carbsHive = 0;
      protainHive = 0;
      fatHive = 0;
      setState(() {});
    }
  }

  @override
  void didUpdateWidget(covariant PercontWidget oldWidget) {
    getSavedData();
    getHiveModel();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    getSavedData();
    getHiveModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CircularPercentIndicator(
            radius: 55,
            lineWidth: 7,
            percent: carbsHive / carbs > 1 ? 1 : carbsHive / carbs,
            progressColor: const Color(0xff590085),
            backgroundColor: const Color(0xffF1F1F1),
            circularStrokeCap: CircularStrokeCap.round,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Carbs',
                  style: TextStyle(
                    fontSize: 15.h,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Nunito',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$carbsHive/${carbs}g',
                  style: TextStyle(
                    fontSize: 12.h,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Nunito',
                    color: const Color(0xff706B6A),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: CircularPercentIndicator(
            radius: 55,
            lineWidth: 7,
            percent: protainHive / protain > 1 ? 1 : protainHive / protain,
            progressColor: const Color(0xff590085),
            backgroundColor: const Color(0xffF1F1F1),
            circularStrokeCap: CircularStrokeCap.round,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Protein',
                  style: TextStyle(
                    fontSize: 15.h,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Nunito',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$protainHive/${protain}g',
                  style: TextStyle(
                    fontSize: 12.h,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Nunito',
                    color: const Color(0xff706B6A),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: CircularPercentIndicator(
            radius: 55,
            lineWidth: 7,
            percent: fatHive / fat > 1 ? 1 : fatHive / fat,
            progressColor: const Color(0xff590085),
            backgroundColor: const Color(0xffF1F1F1),
            circularStrokeCap: CircularStrokeCap.round,
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Fat',
                  style: TextStyle(
                    fontSize: 15.h,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Nunito',
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$fatHive/${fat}g',
                  style: TextStyle(
                    fontSize: 12.h,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Nunito',
                    color: const Color(0xff706B6A),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
