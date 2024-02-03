import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_zone_248/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:workout_zone_248/screen/onboarding/widget/button_widget.dart';
import 'package:workout_zone_248/screen/onboarding/widget/onboarding_item_widget.dart';
import 'package:workout_zone_248/screen/premium/premium_screen.dart';
import 'package:workout_zone_248/style/app_colors.dart';
import 'package:workout_zone_248/utils/images/app_images.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  currantPage = value;
                });
              },
              children: const [
                OnBoardingItemWidget(
                  imageOnBoar: AppImages.onboardingOne,
                  titleOnBoar: 'Start Your Fitness Journey',
                  titleTwoOnBoar:
                      'Discover personalized workout plans and nutrition\nguidance tailored just for you.',
                ),
                OnBoardingItemWidget(
                  imageOnBoar: AppImages.onboardingTwo,
                  titleOnBoar: 'Monitor Your Achievements',
                  titleTwoOnBoar:
                      'Easily track your workouts, nutrition, and health\nstats to see your improvement over time.',
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ButtonWidget(
              color: AppColorsWorkoutZone.color590085,
              onPress: () async {
                if (currantPage == 1) {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PremiumScreen(),
                    ),
                  );
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('isOpened', true);
                  await Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavigatorScreen(),
                    ),
                    (pred) => false,
                  );
                } else {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              text: 'Next',
              radius: 40,
              height: 65.h,
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
