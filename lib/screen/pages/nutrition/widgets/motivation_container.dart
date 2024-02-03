import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MotivationContainer extends StatefulWidget {
  const MotivationContainer({super.key, this.titles, this.descs});
  final List<String>? titles;
  final List<String>? descs;

  @override
  State<MotivationContainer> createState() => _MotivationContainerState();
}

class _MotivationContainerState extends State<MotivationContainer> {
  final randomIndex = Random().nextInt(6);
  List<String> titles = [
    'Stay Hydrated',
    'Embrace the Rainbow',
    'Nourish from Within',
    'Build with Protein',
    'Balance is Key',
    'Treat Your Temple',
  ];

  List<String> descs = [
    'Drink at least 4 cups of clean water a day for your health',
    'Fuel your body with colorful veggies and fruits – a rainbow on your plate is a recipe for good health!',
    'Nourish yourself from the inside out. Choose nutrient-rich foods to support your fitness journey.',
    "Protein is your body's building block. Make sure to include lean sources in your meals for muscle strength.",
    'Balance is the key to a healthy diet. Mix and match food groups for a well-rounded nutrition plan.',
    'Your body is a temple, treat it with respect. Opt for whole grains to boost your energy levels throughout the day.',
  ];

  bool isActive = true;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isActive,
      child: Column(
        children: [
          SizedBox(height: 32.h),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xff615855),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.titles != null
                          ? widget.titles![randomIndex]
                          : titles[randomIndex],
                      style: TextStyle(
                        fontSize: 12.h,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Nunito',
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isActive = false;
                        });
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  widget.descs != null
                      ? widget.descs![randomIndex]
                      : descs[randomIndex],
                  style: TextStyle(
                    fontSize: 15.h,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Nunito',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
