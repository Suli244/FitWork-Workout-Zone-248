import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_zone_248/screen/pages/nutrition/food_detail_screen.dart';
import 'package:workout_zone_248/screen/pages/nutrition/food_model/food_model.dart';

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget({
    super.key,
    required this.model,
  });
  final FoodList model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => FoodDetailScreen(model: model),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: const Color(0xffF1F1F1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                model.title,
                style: TextStyle(
                  fontSize: 19.h,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Nunito',
                ),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 4.h),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                model.ingredients,
                style: TextStyle(
                  fontSize: 15.h,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Nunito',
                  color: const Color(0xff615855),
                ),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${model.carbohydrates}g',
                          style: TextStyle(
                            fontSize: 19.h,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Nunito',
                            color: const Color(0xff590085),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Carbs',
                          style: TextStyle(
                            fontSize: 12.h,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Nunito',
                            color: const Color(0xff706B6A),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${model.protein}g',
                          style: TextStyle(
                            fontSize: 19.h,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Nunito',
                            color: const Color(0xff590085),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Protein',
                          style: TextStyle(
                            fontSize: 12.h,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Nunito',
                            color: const Color(0xff706B6A),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${model.fats}g',
                          style: TextStyle(
                            fontSize: 19.h,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Nunito',
                            color: const Color(0xff590085),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Fat',
                          style: TextStyle(
                            fontSize: 12.h,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Nunito',
                            color: const Color(0xff706B6A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 9.w),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: CachedNetworkImage(
                      height: 104,
                      fit: BoxFit.cover,
                      imageUrl: model.image,
                      placeholder: (context, url) => const SizedBox(
                        height: 104,
                        width: 50,
                        child: CircularProgressIndicator.adaptive(),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
