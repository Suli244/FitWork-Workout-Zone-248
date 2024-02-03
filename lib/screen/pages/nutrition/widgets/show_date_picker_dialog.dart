import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

Future<DateTime> showDatePickerDialog(
    BuildContext context, DateTime selecedDateFrom) async {
  DateTime selecedDate = selecedDateFrom;
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
      content: StatefulBuilder(builder: (context, setState) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: TableCalendar(
            onDayLongPressed: (day, day1) {},
            locale: 'en_EN',
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerStyle: HeaderStyle(
              leftChevronIcon: const Icon(
                Icons.chevron_left,
                color: Color(0xff007AFF),
              ),
              rightChevronIcon: const Icon(
                Icons.chevron_right,
                color: Color(0xff007AFF),
              ),
              titleTextStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
              titleCentered: true,
              titleTextFormatter: (date, locale) =>
                  DateFormat.yMMM('en').format(date),
              formatButtonVisible: false,
              headerPadding: const EdgeInsets.only(top: 20, bottom: 30),
              rightChevronPadding: const EdgeInsets.only(right: 30),
              leftChevronPadding: const EdgeInsets.only(left: 30),
            ),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              withinRangeTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
              selectedTextStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0xff007AFF),
              ),
              defaultTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              weekendTextStyle: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              selectedDecoration: BoxDecoration(
                color: const Color(0xff007AFF).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              todayTextStyle: const TextStyle(
                color: Color(0xff007AFF),
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
              todayDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(
                color: Colors.black.withOpacity(0.3),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
              weekdayStyle: TextStyle(
                color: Colors.black.withOpacity(0.3),
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: selecedDate,
            selectedDayPredicate: (day) => isSameDay(selecedDate, day),
            calendarFormat: CalendarFormat.month,
            rangeSelectionMode: RangeSelectionMode.toggledOff,
            onDaySelected: (selectedDayFrom, focusedDay) {
              selecedDate = selectedDayFrom;
              setState(() {});
              Navigator.pop(context);
            },
            onPageChanged: (focusedDay) {
              focusedDay = focusedDay;
            },
          ),
        );
      }),
    ),
  );
  return selecedDate;
}
