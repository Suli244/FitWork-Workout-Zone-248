import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_zone_248/sdgsdg/sdd/afsfasfas.dart';
import 'package:workout_zone_248/dafsas/asfafsag.dart';

class PremiumItemWidget extends StatelessWidget {
  const PremiumItemWidget({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColorsWorkoutZone.color590085.withOpacity(0.25),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 10.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              Dvsdsd.starIcon,
              width: 24,
            ),
            SizedBox(width: 10.w),
            Text(
              title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                fontFamily: 'ro',
                color: Colors.white,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
