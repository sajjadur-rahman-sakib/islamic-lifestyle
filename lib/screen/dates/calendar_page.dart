import 'package:flutter/material.dart';
import 'package:deen/screen/dates/selected_date.dart';
import 'package:deen/utility/app_colors.dart';
import 'package:deen/widget/option_app_bar.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime englishDateTime = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      englishDateTime = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: optionAppBar('Calendar'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(color: AppColors.textDefaultColor),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: AppColors.iconDefaultColor,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: AppColors.textDefaultColor,
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: AppColors.textDefaultColor,
                ),
                weekendStyle: TextStyle(
                  color: AppColors.textDefaultColor,
                ),
              ),
              calendarStyle: const CalendarStyle(
                defaultTextStyle: TextStyle(
                  color: AppColors.textDefaultColor,
                ),
                weekendTextStyle: TextStyle(
                  color: AppColors.textDefaultColor,
                ),
                selectedTextStyle: TextStyle(color: AppColors.textDefaultColor),
                todayTextStyle: TextStyle(color: AppColors.textDefaultColor),
                todayDecoration: BoxDecoration(
                  color: AppColors.functionalTextBoxColor,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: AppColors.secondaryBackgroundColor,
                  shape: BoxShape.circle,
                ),
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, englishDateTime),
              focusedDay: englishDateTime,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: _onDaySelected,
            ),
            SizedBox(
              height: height / 20,
            ),
            SelectedDate(englishDateTime: englishDateTime),
          ],
        ),
      ),
    );
  }
}
