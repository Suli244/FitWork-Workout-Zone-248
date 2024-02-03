import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_zone_248/screen/pages/nutrition/add_meal_screen.dart';

class AddMealButton extends StatelessWidget {
  const AddMealButton({
    super.key,
    required this.type,
    required this.minKCal,
    required this.maxKCal,
    required this.onTapAdd,
  });

  final String type;
  final int minKCal;
  final int maxKCal;
  final Function() onTapAdd;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type,
              style: TextStyle(
                fontSize: 26.h,
                fontWeight: FontWeight.w700,
                fontFamily: 'Nunito',
                color: Colors.black,
              ),
            ),
            Text(
              'Recommended $minKCal-$maxKCal kcal',
              style: TextStyle(
                fontSize: 15.h,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito',
                color: const Color(0xff706B6A),
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => AddMealScreen(
                  meal: type,
                  minkCal: minKCal,
                  maxkCal: maxKCal,
                ),
              ),
            );
            onTapAdd();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: const Color(0xff590085),
            ),
            child: Text(
              'Add',
              style: TextStyle(
                fontSize: 15.h,
                fontWeight: FontWeight.w500,
                fontFamily: 'Nunito',
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
