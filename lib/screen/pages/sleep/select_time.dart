import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:workout_zone_248/screen/pages/sleep/model/sleep_model.dart';
import 'package:workout_zone_248/utils/images/app_images.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({super.key});

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  var startDate = DateTime.now();
  var endDate = DateTime.now();
  bool selectFirst = false;
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('SelectTime'),
        leading: IconButton(
          onPressed: () async {
            final date = DateFormat('d').format(startDate);
            final model = ModelXMan(
              startDate: startDate,
              endDate: endDate,
              date: int.parse(date),
            );
            if (isDateRangeValid(model)) {
              Navigator.pop(
                context,
                model,
              );
              var box = await Hive.openBox<ModelXMan>('timeX');
              box.add(model);
            } else {
              showError = true;
              setState(() {});
            }
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Start',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                selectFirst = true;
                setState(() {});
              },
              child: Container(
                height: 72,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xffF1F1F1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: selectFirst ? Colors.green : Colors.transparent,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat('hh:mm').format(startDate)),
                    Image.asset(
                      AppImages.clockIcon,
                      scale: 3,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'End',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: () {
                selectFirst = false;
                setState(() {});
              },
              child: Container(
                height: 72,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xffF1F1F1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: showError
                        ? Colors.red
                        : selectFirst
                            ? Colors.transparent
                            : Colors.green,
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(DateFormat('hh:mm').format(endDate)),
                    Image.asset(
                      AppImages.clockIcon,
                      scale: 3,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                initialDateTime: startDate,
                mode: CupertinoDatePickerMode.time,
                onDateTimeChanged: (DateTime newDate) {
                  if (selectFirst) {
                    startDate = newDate;
                  } else {
                    endDate = newDate;
                  }
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool isDateRangeValid(ModelXMan model) {
  if (model.endDate.isBefore(model.startDate)) {
    return false;
  } else {
    return true;
  }
}
