import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_zone_248/screen/pages/nutrition/food_detail_screen.dart';
import 'package:workout_zone_248/screen/pages/nutrition/food_model/food_model.dart';
import 'package:workout_zone_248/screen/sadgas/sddga.dart';

class FoodItemWidget extends StatefulWidget {
  const FoodItemWidget({
    super.key,
    required this.model,
  });
  final FoodList model;

  @override
  State<FoodItemWidget> createState() => _FoodItemWidgetState();
}

class _FoodItemWidgetState extends State<FoodItemWidget> {
  @override
  void initState() {
    getPremBuy();
    super.initState();
  }

  bool isBuyPrem = true;
  getPremBuy() async {
    final pr = await SharedPreferences.getInstance();
    isBuyPrem = pr.getBool('ISBUY') ?? false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isBuyPrem) {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => FoodDetailScreen(model: widget.model),
            ),
          );
        } else {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const DFsdgsgs(isPop: true),
            ),
          );
        }
      },
      child: Stack(
        children: [
          Container(
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
                    widget.model.title,
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
                    widget.model.ingredients,
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
                              '${widget.model.carbohydrates}g',
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
                              '${widget.model.protein}g',
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
                              '${widget.model.fats}g',
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
                          borderRadius: BorderRadius.circular(22),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: CachedNetworkImage(
                          height: 104,
                          fit: BoxFit.cover,
                          imageUrl: widget.model.image,
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
          if (!isBuyPrem) BloorWidget(model: widget.model),
        ],
      ),
    );
  }
}

class BloorWidget extends StatelessWidget {
  const BloorWidget({super.key, required this.model});
  final FoodList model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: const Color(0xff9B9B9B).withOpacity(0.6),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Opacity(
            opacity: 0,
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
        ),
      ),
    );
  }
}
