import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_zone_248/utils/images/app_images.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  String carbs = '';
  String protein = '';
  String fats = '';

  bool get isAllSet =>
      carbs.isNotEmpty && protein.isNotEmpty && fats.isNotEmpty;

  @override
  void initState() {
    getSavedData();
    super.initState();
  }

  final carbsControlller = TextEditingController();
  final protainControlller = TextEditingController();
  final fatControlller = TextEditingController();
  getSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    carbsControlller.text = (prefs.getInt('carbs') ?? 0).toString();
    protainControlller.text = (prefs.getInt('protain') ?? 0).toString();
    fatControlller.text = (prefs.getInt('fat') ?? 0).toString();

    carbs = carbsControlller.text;
    protein = protainControlller.text;
    fats = fatControlller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Edit'),
        titleTextStyle: TextStyle(
          fontSize: 26.h,
          fontWeight: FontWeight.w700,
          fontFamily: 'Nunito',
          color: Colors.black,
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: RotatedBox(
              quarterTurns: 1,
              child: Image.asset(
                AppImages.arrowDownIcon,
                width: 12.h,
                color: const Color(0xff706B6A),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            onTap: isAllSet
                ? () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setInt('carbs', int.parse(carbs));
                    prefs.setInt('protain', int.parse(protein));
                    prefs.setInt('fat', int.parse(fats));
                    Navigator.pop(context);
                  }
                : null,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: isAllSet
                    ? const Color(0xff590085)
                    : const Color(0xffF1F1F1),
              ),
              child: Text(
                'Add',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19.h,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Nunito',
                  color: isAllSet ? Colors.white : const Color(0xff706B6A),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              SizedBox(height: 32.h),
              Text(
                'Choose a daily allowance for yourself',
                style: TextStyle(
                  fontSize: 15.h,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Nunito',
                  color: const Color(0xff706B6A),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Carbs',
                style: TextStyle(
                  fontSize: 15.h,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Nunito',
                  color: const Color(0xff706B6A),
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: carbsControlller,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                onChanged: (value) {
                  carbs = value;
                  setState(() {});
                },
                decoration: const InputDecoration(
                  hintText: 'Enter amount',
                  fillColor: Color(0xffF1F1F1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffF1F1F1),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffF1F1F1),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffF1F1F1),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Protein',
                style: TextStyle(
                  fontSize: 15.h,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Nunito',
                  color: const Color(0xff706B6A),
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: protainControlller,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                onChanged: (value) {
                  protein = value;
                  setState(() {});
                },
                decoration: const InputDecoration(
                  hintText: 'Enter amount',
                  fillColor: Color(0xffF1F1F1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffF1F1F1),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffF1F1F1),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffF1F1F1),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Fats',
                style: TextStyle(
                  fontSize: 15.h,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Nunito',
                  color: const Color(0xff706B6A),
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: fatControlller,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                onChanged: (value) {
                  fats = value;
                  setState(() {});
                },
                decoration: const InputDecoration(
                  hintText: 'Enter amount',
                  fillColor: Color(0xffF1F1F1),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffF1F1F1),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffF1F1F1),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffF1F1F1),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
