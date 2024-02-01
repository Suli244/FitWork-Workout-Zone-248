import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_zone_248/style/app_colors.dart';

class RestoreButtons extends StatelessWidget {
  const RestoreButtons({
    super.key,
    required this.onPressPrivacyPolicy,
    required this.onPressTermOfService,
    required this.onPressRestorePurchases,
  });

  final Function() onPressPrivacyPolicy;
  final Function() onPressTermOfService;
  final Function() onPressRestorePurchases;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10.w),
        InkWell(
          onTap: onPressPrivacyPolicy,
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
          onTap: onPressTermOfService,
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
          onTap: onPressRestorePurchases,
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
