import 'package:apphud/apphud.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_zone_248/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:workout_zone_248/screen/sadgas/widget/web_view_insightful_news.dart';
import 'package:workout_zone_248/dafsas/asfafsag.dart';

class RestoreButtons extends StatelessWidget {
  const RestoreButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.w),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WebFFWorkoutZone(
                  title: 'Privacy policy',
                  url:
                      'https://doc-hosting.flycricket.io/fitwork-workout-zone-privacy-policy/bf7b7156-df32-4b34-a5d3-5c8c43dba08c/privacy',
                ),
              ),
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.80,
                  color: AppColorsWorkoutZone.color25140F,
                ),
              ),
            ),
            child: const Text(
              'Privacy policy',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: AppColorsWorkoutZone.color25140F,
              ),
            ),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WebFFWorkoutZone(
                  title: 'Terms of use',
                  url:
                      'https://doc-hosting.flycricket.io/fitwork-workout-zone-terms-of-use/6edd3c26-7c14-4bab-a377-30af4350acb1/terms',
                ),
              ),
            );
          },
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.80,
                  color: AppColorsWorkoutZone.color25140F,
                ),
              ),
            ),
            child: const Text(
              'Terms of use',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: AppColorsWorkoutZone.color25140F,
              ),
            ),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () async {
            final hasPremiumAccess = await Apphud.hasPremiumAccess();
            final hasActiveSubscription = await Apphud.hasActiveSubscription();
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
                      'Your purchase is not found. Write to support: https://forms.gle/ncosJHVoEoZpHyXg8'),
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
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.80,
                  color: AppColorsWorkoutZone.color25140F,
                ),
              ),
            ),
            child: const Text(
              'Restore purchases',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: AppColorsWorkoutZone.color25140F,
              ),
            ),
          ),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}
