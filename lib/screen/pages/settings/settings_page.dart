import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_zone_248/screen/pages/settings/widget/settings_item_widget.dart';
import 'package:workout_zone_248/screen/premium/premium_screen.dart';
import 'package:workout_zone_248/screen/premium/widget/web_view_insightful_news.dart';
import 'package:workout_zone_248/style/app_colors.dart';
import 'package:workout_zone_248/utils/premium/premium.dart';
import 'package:workout_zone_248/utils/urls.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isPremiumNews = true;

  @override
  void initState() {
    getPremium();
    super.initState();
  }

  getPremium() async {
    isPremiumNews = await PremiumWebWorkoutZone.getPremium();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w500,
            fontFamily: 'ro',
            color: AppColorsWorkoutZone.color25140F,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Column(
          children: [
            if (!isPremiumNews)
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (cotext) => const PremiumScreen(),
                    ),
                  );
                },
                child: Container(
                  height: 72.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColorsWorkoutZone.color590085,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 24.h,
                    ),
                    child: const Row(
                      children: [
                        Text(
                          'BUY PREMIUM FOR \$0.99',
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'ro',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            SettingsItemWidget(
                titl: 'Restore purchases', onTaab: () {},),
            SettingsItemWidget(
              titl: 'Privacy policy',
              onTaab: () {
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
            SettingsItemWidget(
              titl: 'Terms of use',
              onTaab: () {
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
             
            ),
            SettingsItemWidget(titl: 'Support', onTaab: () {},),
          ],
        ),
      ),
    );
  }
}
