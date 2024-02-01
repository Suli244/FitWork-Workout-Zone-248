import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_zone_248/style/app_colors.dart';
import 'package:workout_zone_248/utils/images/app_images.dart';

class SettingsItemWidget extends StatelessWidget {
  const SettingsItemWidget({
    super.key,
    required this.titl,
    required this.onTaab,
  });
  final String titl;
  final Function() onTaab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: onTaab,
        child: Container(
          height: 72.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColorsWorkoutZone.colorF1F1F1,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 24.h,
            ),
            child: Row(
              children: [
                Text(
                  titl,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'nu',
                    color: AppColorsWorkoutZone.color25140F,
                  ),
                ),
                const Spacer(),
                Image.asset(AppImages.arrowRightIcon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
