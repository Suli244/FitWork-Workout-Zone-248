import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_zone_248/dafsas/asfafsag.dart';
import 'package:workout_zone_248/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:workout_zone_248/screen/pages/settings/widget/settings_item_widget.dart';
import 'package:workout_zone_248/screen/sadgas/sddga.dart';
import 'package:workout_zone_248/screen/sadgas/widget/web_view_insightful_news.dart';

class EFkjadnf extends StatefulWidget {
  const EFkjadnf({super.key});

  @override
  State<EFkjadnf> createState() => _EFkjadnfState();
}

class _EFkjadnfState extends State<EFkjadnf> {
  bool isPremiumNews = true;

  @override
  void initState() {
    getPremium();
    super.initState();
  }

  getPremium() async {
    final prefs = await SharedPreferences.getInstance();
    isPremiumNews = prefs.getBool('ISBUY') ?? false;
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
                      builder: (cotext) => const DFsdgsgs(),
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
            if (!isPremiumNews)
              SettingsItemWidget(
                titl: 'Restore purchases',
                onTaab: () async {
                  final hasPremiumAccess = await Apphud.hasPremiumAccess();
                  final hasActiveSubscription =
                      await Apphud.hasActiveSubscription();
                  if (hasPremiumAccess || hasActiveSubscription) {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('ISBUY', true);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: const Text('Success!'),
                        content: const Text('Your purchase has been restored!'),
                        actions: [
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const BottomNavigatorScreen(),
                                ),
                                (route) => false,
                              );
                            },
                            child: const Text('Ok'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                        title: const Text('Restore purchase'),
                        content: const Text(
                            'Your purchase is not found. Write to support: https://docs.google.com/forms/d/e/1FAIpQLSe2dY5sixywVpTYU9K34aEqYi67rDquTx9XMeDZWeU2de_rag/viewform?usp=sf_link'),
                        actions: [
                          CupertinoDialogAction(
                            isDefaultAction: true,
                            onPressed: () => {Navigator.of(context).pop()},
                            child: const Text('Ok'),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            SettingsItemWidget(
              titl: 'Privacy policy',
              onTaab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebFFWorkoutZone(
                      title: 'Privacy Policy',
                      url:
                          'https://doc-hosting.flycricket.io/fitwork-workout-zone-privacy-policy/bf7b7156-df32-4b34-a5d3-5c8c43dba08c/privacy',
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
                      url:
                          'https://doc-hosting.flycricket.io/fitwork-workout-zone-terms-of-use/6edd3c26-7c14-4bab-a377-30af4350acb1/terms',
                    ),
                  ),
                );
              },
            ),
            SettingsItemWidget(
              titl: 'Support',
              onTaab: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebFFWorkoutZone(
                      title: 'Term of use',
                      url:
                          'https://docs.google.com/forms/d/e/1FAIpQLSe2dY5sixywVpTYU9K34aEqYi67rDquTx9XMeDZWeU2de_rag/viewform?usp=sf_link',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
