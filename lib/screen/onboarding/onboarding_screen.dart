import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_zone_248/dafsas/asfafsag.dart';
import 'package:workout_zone_248/screen/onboarding/widget/button_widget.dart';
import 'package:workout_zone_248/screen/onboarding/widget/onboarding_item_widget.dart';
import 'package:workout_zone_248/screen/sadgas/sddga.dart';
import 'package:workout_zone_248/sdgsdg/sdd/afsfasfas.dart';

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
                  imageOnBoar: Dvsdsd.onboardingOne,
                  titleOnBoar: 'Start Your Fitness Journey',
                  titleTwoOnBoar:
                      'Discover personalized workout plans and nutrition\nguidance tailored just for you.',
                ),
                OnBoardingItemWidget(
                  imageOnBoar: Dvsdsd.onboardingTwo,
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
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('isOpened', true);
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DFsdgsgs(),
                    ),
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
