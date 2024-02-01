import 'package:flutter/material.dart';
import 'package:workout_zone_248/screen/pages/home/home_page.dart';
import 'package:workout_zone_248/screen/pages/nutrition/nutrition_page.dart';
import 'package:workout_zone_248/screen/pages/settings/settings_page.dart';
import 'package:workout_zone_248/screen/pages/sleep/sleep_page.dart';
import 'package:workout_zone_248/screen/pages/workouts/workouts_page.dart';
import 'package:workout_zone_248/style/app_colors.dart';
import 'package:workout_zone_248/utils/images/app_images.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigatorScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 15,
        selectedFontSize: 15,
        currentIndex: index,
        onTap: (indexFrom) async {
          setState(() {
            index = indexFrom;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.homeIcon,
              width: 27,
              color: AppColorsWorkoutZone.color706B6A,
            ),
            activeIcon: Image.asset(
              AppImages.homeIcon,
              color: AppColorsWorkoutZone.color590085,
              width: 27,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.workoutsIcon,
              width: 22.50,
              color: AppColorsWorkoutZone.color706B6A,
            ),
            activeIcon: Image.asset(
              AppImages.workoutsIcon,
              color: AppColorsWorkoutZone.color590085,
              width: 22.50,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.nutritionIcon,
              width: 28,
              color: AppColorsWorkoutZone.color706B6A,
            ),
            activeIcon: Image.asset(
              AppImages.nutritionIcon,
              color: AppColorsWorkoutZone.color590085,
              width: 28,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.sleepIcon,
              width: 23,
              color: AppColorsWorkoutZone.color706B6A,
            ),
            activeIcon: Image.asset(
              AppImages.sleepIcon,
              color: AppColorsWorkoutZone.color590085,
              width: 23,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.settingsIcon,
              width: 27,
              color: AppColorsWorkoutZone.color706B6A,
            ),
            activeIcon: Image.asset(
              AppImages.settingsIcon,
              color: AppColorsWorkoutZone.color590085,
              width: 27,
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> pages = [
  const HomePage(),
  const WorkoutsPage(),
  const NutritionPage(),
  const SleepPage(),
  const SettingsPage(),
];
