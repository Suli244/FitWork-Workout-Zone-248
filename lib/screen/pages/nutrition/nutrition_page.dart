import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_zone_248/screen/pages/nutrition/edit_screen.dart';
import 'package:workout_zone_248/screen/pages/nutrition/get_meal_cubit/get_meal_cubit.dart';
import 'package:workout_zone_248/screen/pages/nutrition/widgets/add_meal_button.dart';
import 'package:workout_zone_248/screen/pages/nutrition/widgets/dates_widget.dart';
import 'package:workout_zone_248/screen/pages/nutrition/widgets/motivation_container.dart';
import 'package:workout_zone_248/screen/pages/nutrition/widgets/percont_widget.dart';
import 'package:workout_zone_248/screen/pages/nutrition/widgets/recomened_widget.dart';
import 'package:workout_zone_248/screen/pages/nutrition/widgets/show_nutriotion_info_dialog.dart';

class NutritionPage extends StatefulWidget {
  const NutritionPage({super.key});

  @override
  State<NutritionPage> createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  int nowDate = DateTime.now().day;
  @override
  void initState() {
    showInfo();
    super.initState();
  }

  showInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getBool('show') ?? false;
    if (!result) {
      showNutritionInfoDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMealCubit(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView(
              padding: const EdgeInsets.only(bottom: 50),
              physics: const ClampingScrollPhysics(),
              children: [
                Text(
                  'Nutrition',
                  style: TextStyle(
                    fontSize: 26.h,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Nunito',
                  ),
                ),
                const MotivationContainer(),
                SizedBox(height: 32.h),
                DatesWidget(
                  onSelectDate: (selectedDate) {
                    setState(() {
                      nowDate = selectedDate;
                    });
                  },
                ),
                SizedBox(height: 32.h),
                PercontWidget(date: nowDate),
                SizedBox(height: 16.h),
                Center(
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const EditScreen(),
                        ),
                      );
                      setState(() {});
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 36.h,
                      width: 208.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color(0xff706B6A),
                      ),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 15.h,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Nunito',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  'Meals',
                  style: TextStyle(
                    fontSize: 15.h,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Nunito',
                    color: const Color(0xff706B6A),
                  ),
                ),
                const Divider(color: Color(0xffF1F1F1)),
                SizedBox(height: 16.h),
                AddMealButton(
                  type: 'Breakfast',
                  minKCal: 300,
                  maxKCal: 500,
                  onTapAdd: () {
                    setState(() {});
                  },
                ),
                SizedBox(height: 16.h),
                AddMealButton(
                  type: 'Lunch',
                  minKCal: 500,
                  maxKCal: 700,
                  onTapAdd: () {
                    setState(() {});
                  },
                ),
                SizedBox(height: 16.h),
                AddMealButton(
                  type: 'Dinner',
                  minKCal: 500,
                  maxKCal: 700,
                  onTapAdd: () {
                    setState(() {});
                  },
                ),
                SizedBox(height: 40.h),
                Text(
                  'Recommended',
                  style: TextStyle(
                    fontSize: 15.h,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Nunito',
                    color: const Color(0xff706B6A),
                  ),
                ),
                const Divider(color: Color(0xffF1F1F1)),
                SizedBox(height: 16.h),
                BlocBuilder<GetMealCubit, GetMealState>(
                  builder: (context, state) {
                    return state.when(
                      loading: () => const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                      error: (error) => Center(
                        child: Text(error),
                      ),
                      success: (model) => ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: model.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemBuilder: (context, index) => RecomenedWidget(
                          index: index,
                          model: model[index],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
