import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> showNutritionInfoDialog(BuildContext context) async {
  await Future.delayed(const Duration(milliseconds: 500));
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 24.h),
          Text(
            'Disclamer',
            style: TextStyle(
              fontSize: 26.h,
              fontWeight: FontWeight.w700,
              fontFamily: 'Nunito',
              color: Colors.black,
            ),
          ),
          SizedBox(height: 7.h),
          Text(
            'The offer of a food variant serves solely as a recommendation and does not imply any liability for any aspects related to its preparation, consumption or possible negative consequences. We are not responsible for any allergies, individual preferences, health conditions or other circumstances that may arise as a result of eating the suggested food variant. It is recommended that you consult with medical or nutritional professionals before making any dietary changes.',
            style: TextStyle(
              fontSize: 15.h,
              fontWeight: FontWeight.w500,
              fontFamily: 'Nunito',
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 7.h),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(0xff590085),
              ),
              child: Text(
                'Okay',
                style: TextStyle(
                  fontSize: 19.h,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Nunito',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    ),
  );
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('show', true);
}
