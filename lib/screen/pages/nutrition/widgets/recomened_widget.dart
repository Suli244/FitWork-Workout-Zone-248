import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:workout_zone_248/screen/pages/nutrition/food_model/food_model.dart';
import 'package:workout_zone_248/screen/pages/nutrition/widgets/food_item_widget.dart';

class RecomenedWidget extends StatelessWidget {
  const RecomenedWidget({super.key, required this.index, required this.model});
  final int index;
  final MealModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          model.type,
          style: TextStyle(
            fontSize: 26.h,
            fontWeight: FontWeight.w700,
            fontFamily: 'Nunito',
            color: Colors.black,
          ),
        ),
        Text(
          index == 0 ? 'Recommended 300-500 kcal' : 'Recommended 500-700 kcal',
          style: TextStyle(
            fontSize: 15.h,
            fontWeight: FontWeight.w500,
            fontFamily: 'Nunito',
            color: const Color(0xff706B6A),
          ),
        ),
        const SizedBox(height: 8),
        MasonryGridView.count(
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: model.foodList.length,
          crossAxisCount: 2,
          itemBuilder: (context, index) => FoodItemWidget(
            model: model.foodList[index],
          ),
        ),
      ],
    );
  }
}
