import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_zone_248/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:workout_zone_248/screen/onboarding/widget/button_widget.dart';
import 'package:workout_zone_248/screen/premium/widget/premium_item_widget.dart';
import 'package:workout_zone_248/screen/premium/widget/restore_widgets.dart';
import 'package:workout_zone_248/screen/premium/widget/web_view_insightful_news.dart';
import 'package:workout_zone_248/style/app_colors.dart';
import 'package:workout_zone_248/utils/images/app_images.dart';
import 'package:workout_zone_248/utils/urls.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                AppImages.premium,
                width: 390.w,
                height: 546.h,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'PREMIUM ACCESS:',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'ro',
                      color: AppColorsWorkoutZone.color25140F,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  const PremiumItemWidget(
                    title: 'Get access to personalized\nworkouts!',
                  ),
                  SizedBox(height: 16.h),
                  const PremiumItemWidget(
                    title:
                        'Get access to personalized\nnutrition recommendations!',
                  ),
                  SizedBox(height: 24.h),
                  ButtonWidget(
                    color: AppColorsWorkoutZone.color590085,
                    onPress: () async {
                      /////// Premium /////////
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('ISBUY', true);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BottomNavigatorScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    text: 'BUY PREMIUM FOR \$0.99',
                    radius: 16,
                    height: 72.h,
                  ),
                  SizedBox(height: 20.h),
                  RestoreButtons(
                    onPressTermOfService: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebFFWorkoutZone(
                            title: 'Term of use',
                            url: DocFFWorkoutZone.tUse,
                          ),
                        ),
                      );
                    },
                    onPressRestorePurchases: () {},
                    onPressPrivacyPolicy: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebFFWorkoutZone(
                            title: 'Privacy Policy',
                            url: DocFFWorkoutZone.pP,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 45.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
