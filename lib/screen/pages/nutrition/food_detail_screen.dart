import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_zone_248/screen/pages/nutrition/food_model/food_model.dart';
import 'package:workout_zone_248/screen/pages/nutrition/widgets/show_nutriotion_info_dialog.dart';
import 'package:workout_zone_248/sdgsdg/sdd/afsfasfas.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({super.key, required this.model});
  final FoodList model;

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  void initState() {
    showNutritionInfoDialog(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            expandedHeight: 415.h,
            title: Text(widget.model.title),
            titleTextStyle: TextStyle(
              fontSize: 26.h,
              fontWeight: FontWeight.w700,
              fontFamily: 'Nunito',
              color: Colors.white,
            ),
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Image.asset(
                    Dvsdsd.arrowDownIcon,
                    width: 12.h,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                height: 15,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.sp),
                    topRight: Radius.circular(16.sp),
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: widget.model.image,
                width: double.maxFinite,
                height: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Ingredients: ${widget.model.ingredients}',
                    style: TextStyle(
                      fontSize: 15.h,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Nunito',
                      color: const Color(0xff706B6A),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    ' • Protein: ${widget.model.protein}g',
                    style: TextStyle(
                      fontSize: 15.h,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Nunito',
                      color: const Color(0xff706B6A),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    ' • Carbohydrates: ${widget.model.carbohydrates}g',
                    style: TextStyle(
                      fontSize: 15.h,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Nunito',
                      color: const Color(0xff706B6A),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    ' • Fats: ${widget.model.fats}g',
                    style: TextStyle(
                      fontSize: 15.h,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Nunito',
                      color: const Color(0xff706B6A),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    widget.model.description,
                    style: TextStyle(
                      fontSize: 15.h,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Nunito',
                      color: const Color(0xff706B6A),
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
