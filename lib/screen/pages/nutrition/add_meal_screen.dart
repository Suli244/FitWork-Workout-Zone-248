import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:workout_zone_248/screen/pages/nutrition/food_model/kcal_hive_model.dart';
import 'package:workout_zone_248/screen/pages/nutrition/widgets/show_date_picker_dialog.dart';
import 'package:workout_zone_248/screen/pages/nutrition/widgets/show_select_meal_type_dialog.dart';
import 'package:workout_zone_248/utils/images/app_images.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({
    super.key,
    required this.meal,
    required this.minkCal,
    required this.maxkCal,
  });
  final String meal;
  final int minkCal;
  final int maxkCal;
  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  DateTime dateNow = DateTime.now();
  final dateFormat = DateFormat('dd MMM yyyy');
  late String date = dateFormat.format(dateNow);
  late String meal = widget.meal;
  String carbs = '';
  String protein = '';
  String fats = '';

  bool get isAllSet =>
      date.isNotEmpty &&
      meal.isNotEmpty &&
      carbs.isNotEmpty &&
      protein.isNotEmpty &&
      fats.isNotEmpty;

  String kcalText() {
    String text = '';
    int kcal = 0;
    if (isAllSet) {
      kcal = (int.parse(carbs) * 4) +
          (int.parse(protein) * 4) +
          (int.parse(fats) * 9);

      if (kcal < widget.minkCal - 50) {
        text = 'Your food is less than the norm!';
      } else if (kcal > widget.maxkCal + 50) {
        text = 'Your food is more than the norm!';
      } else {
        text = 'Your food is within the normal range!';
      }
    }

    return text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Add Meal'),
        titleTextStyle: TextStyle(
          fontSize: 26.h,
          fontWeight: FontWeight.w700,
          fontFamily: 'Nunito',
          color: Colors.black,
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: RotatedBox(
              quarterTurns: 1,
              child: Image.asset(
                AppImages.arrowDownIcon,
                width: 12.h,
                color: const Color(0xff706B6A),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: isAllSet
                ? () async {
                    final kcal = (int.parse(carbs) * 4) +
                        (int.parse(protein) * 4) +
                        (int.parse(fats) * 9);
                    var kcalBox = await Hive.openBox<KCalHiveModel>('kcal');
                    final savedKCals = kcalBox.values.toList();
                    if (savedKCals.isNotEmpty) {
                      final savedOneKcal =
                          savedKCals.where((e) => e.date == date);
                      if (savedOneKcal.isNotEmpty) {
                        savedOneKcal.first.calory += kcal;
                        savedOneKcal.first.carbs += int.parse(carbs);
                        savedOneKcal.first.protein += int.parse(protein);
                        savedOneKcal.first.fats += int.parse(fats);
                        savedOneKcal.first.save();
                      } else {
                        kcalBox.add(
                          KCalHiveModel(
                            calory: kcal,
                            date: date,
                            type: meal,
                            carbs: int.parse(carbs),
                            protein: int.parse(protein),
                            fats: int.parse(fats),
                          ),
                        );
                      }
                    } else {
                      kcalBox.add(
                        KCalHiveModel(
                          calory: kcal,
                          date: date,
                          type: meal,
                          carbs: int.parse(carbs),
                          protein: int.parse(protein),
                          fats: int.parse(fats),
                        ),
                      );
                    }
                    Navigator.pop(context);
                  }
                : null,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: isAllSet
                    ? const Color(0xff590085)
                    : const Color(0xffF1F1F1),
              ),
              child: Text(
                'Add',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19.h,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Nunito',
                  color: isAllSet ? Colors.white : const Color(0xff706B6A),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          padding: const EdgeInsets.only(bottom: 50),
          physics: const ClampingScrollPhysics(),
          children: [
            SizedBox(height: 24.h),
            Text(
              'Date',
              style: TextStyle(
                fontSize: 15.h,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito',
                color: const Color(0xff706B6A),
              ),
            ),
            SizedBox(height: 8.h),
            InkWell(
              onTap: () async {
                final selectedDate =
                    await showDatePickerDialog(context, dateNow);
                setState(() {
                  dateNow = selectedDate;
                  date = dateFormat.format(dateNow);
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffF1F1F1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                        fontSize: 15.h,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Nunito',
                        color: Colors.black,
                      ),
                    ),
                    Image.asset(
                      AppImages.calendarIcon,
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Meal',
              style: TextStyle(
                fontSize: 15.h,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito',
                color: const Color(0xff706B6A),
              ),
            ),
            SizedBox(height: 8.h),
            InkWell(
              onTap: () async {
                final selectedMeal =
                    await showSelectMealTypeDialog(context, meal);
                setState(() {
                  meal = selectedMeal;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 26, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffF1F1F1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      meal,
                      style: TextStyle(
                        fontSize: 15.h,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Nunito',
                        color: Colors.black,
                      ),
                    ),
                    Image.asset(
                      AppImages.arrowDownIcon,
                      height: 24.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Carbs',
              style: TextStyle(
                fontSize: 15.h,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito',
                color: const Color(0xff706B6A),
              ),
            ),
            SizedBox(height: 8.h),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              onChanged: (value) {
                carbs = value;
                setState(() {});
              },
              decoration: const InputDecoration(
                hintText: 'Enter amount',
                fillColor: Color(0xffF1F1F1),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF1F1F1),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF1F1F1),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF1F1F1),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Protein',
              style: TextStyle(
                fontSize: 15.h,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito',
                color: const Color(0xff706B6A),
              ),
            ),
            SizedBox(height: 8.h),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              onChanged: (value) {
                protein = value;
                setState(() {});
              },
              decoration: const InputDecoration(
                hintText: 'Enter amount',
                fillColor: Color(0xffF1F1F1),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF1F1F1),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF1F1F1),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF1F1F1),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Fats',
              style: TextStyle(
                fontSize: 15.h,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito',
                color: const Color(0xff706B6A),
              ),
            ),
            SizedBox(height: 8.h),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              onChanged: (value) {
                fats = value;
                setState(() {});
              },
              decoration: const InputDecoration(
                hintText: 'Enter amount',
                fillColor: Color(0xffF1F1F1),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF1F1F1),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF1F1F1),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF1F1F1),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
            if (isAllSet) const SizedBox(height: 12),
            if (isAllSet)
              Center(
                child: Text(
                  '${(int.parse(carbs) * 4) + (int.parse(protein) * 4) + (int.parse(fats) * 9)} kkal',
                  style: TextStyle(
                    fontSize: 26.h,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Nunito',
                    color: const Color(0xff590085),
                  ),
                ),
              ),
            if (isAllSet) const SizedBox(height: 12),
            if (isAllSet)
              Center(
                child: Text(
                  kcalText(),
                  style: TextStyle(
                    fontSize: 12.h,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Nunito',
                    color: const Color(0xff615855),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
