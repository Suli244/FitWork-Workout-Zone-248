import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_zone_248/style/app_colors.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({
    super.key,
    required this.imageOnBoar,
    required this.titleOnBoar,
    required this.titleTwoOnBoar,
  });
  final String imageOnBoar;
  final String titleOnBoar;
  final String titleTwoOnBoar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            imageOnBoar,
            width: 390.w,
            height: 607.h,
            alignment: Alignment.bottomCenter,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                child: Text(
                  titleOnBoar,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: AppColorsWorkoutZone.color25140F,
                    fontFamily: 'ro',
                    height: 0,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              FittedBox(
                child: Text(
                  titleTwoOnBoar,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColorsWorkoutZone.color706B6A,
                    fontFamily: 'nu',
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
