import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_zone_248/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:workout_zone_248/screen/onboarding/onboarding_screen.dart';
import 'package:workout_zone_248/sdgsdg/sdd/afsfasfas.dart';

class SGedfsdgs extends StatefulWidget {
  const SGedfsdgs({Key? key}) : super(key: key);

  @override
  State<SGedfsdgs> createState() => _SGedfsdgsState();
}

class _SGedfsdgsState extends State<SGedfsdgs> {
  @override
  void initState() {
    toGoOnBoarWorkoutZone();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              Dvsdsd.splashLogo,
              width: 140.w,
              height: 212.h,
            ),
          ),
        ],
      ),
    );
  }

  toGoOnBoarWorkoutZone() async {
    await Future.delayed(const Duration(milliseconds: 1450));
    final prefs = await SharedPreferences.getInstance();
    final isFirst = prefs.getBool('isOpened') ?? false;
    if (!isFirst) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        ),
      );
      await Future.delayed(const Duration(seconds: 8));
      try {
        final InAppReview inAppReview = InAppReview.instance;
        if (await inAppReview.isAvailable()) {
          inAppReview.requestReview();
        }
      } catch (e) {
        throw Exception(e);
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavigatorScreen(),
        ),
      );
    }
  }
}
