import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<String> showSelectMealTypeDialog(
    BuildContext context, String selectedMealFrom) async {
  String selectedMeal = selectedMealFrom;
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      content: StatefulBuilder(builder: (context, setState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24,
              width: MediaQuery.of(context).size.width,
            ),
            Text(
              'Choose Meal',
              style: TextStyle(
                fontSize: 17.h,
                fontWeight: FontWeight.w600,
                fontFamily: 'Nunito',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () {
                setState(() {
                  selectedMeal = 'Breakfast';
                });
                Navigator.pop(context);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Breakfast',
                      style: TextStyle(
                        fontSize: 17.h,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Nunito',
                        color: selectedMeal == 'Breakfast'
                            ? const Color(0xff590085)
                            : Colors.black,
                      ),
                    ),
                    Transform.scale(
                      scale: 1.5,
                      child: Radio(
                        fillColor: MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return const Color(
                                0xff590085); // Цвет активного круга
                          }
                          return const Color(
                              0xffF1F1F1); // Цвет неактивного круга
                        }),
                        activeColor: const Color(0xff590085),
                        value: selectedMeal,
                        groupValue: 'Breakfast',
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                setState(() {
                  selectedMeal = 'Lunch';
                });
                Navigator.pop(context);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lunch',
                      style: TextStyle(
                        fontSize: 17.h,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Nunito',
                        color: selectedMeal == 'Lunch'
                            ? const Color(0xff590085)
                            : Colors.black,
                      ),
                    ),
                    Transform.scale(
                      scale: 1.5,
                      child: Radio(
                        fillColor: MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return const Color(
                                0xff590085); // Цвет активного круга
                          }
                          return const Color(
                              0xffF1F1F1); // Цвет неактивного круга
                        }),
                        activeColor: const Color(0xff590085),
                        value: selectedMeal,
                        groupValue: 'Lunch',
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                setState(() {
                  selectedMeal = 'Dinner';
                });
                Navigator.pop(context);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dinner',
                      style: TextStyle(
                        fontSize: 17.h,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Nunito',
                        color: selectedMeal == 'Dinner'
                            ? const Color(0xff590085)
                            : Colors.black,
                      ),
                    ),
                    Transform.scale(
                      scale: 1.5,
                      child: Radio(
                        fillColor: MaterialStateColor.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return const Color(
                                0xff590085); // Цвет активного круга
                          }
                          return const Color(
                              0xffF1F1F1); // Цвет неактивного круга
                        }),
                        activeColor: const Color(0xff590085),
                        value: selectedMeal,
                        groupValue: 'Dinner',
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        );
      }),
    ),
  );
  return selectedMeal;
}
