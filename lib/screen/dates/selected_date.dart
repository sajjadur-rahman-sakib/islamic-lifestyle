import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:sakib/utility/app_colors.dart';

class SelectedDate extends StatelessWidget {
  const SelectedDate({
    super.key,
    required this.englishDateTime,
  });

  final DateTime englishDateTime;

  @override
  Widget build(BuildContext context) {
    final hijriDateTime = HijriCalendar.fromDate(englishDateTime);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: [
          const Divider(),
          const Text(
            "English Date",
            style: TextStyle(
              color: AppColors.textDefaultColor,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: height / 80,
          ),
          Container(
            height: height / 16,
            width: width / 2,
            decoration: BoxDecoration(
              color: AppColors.functionalTextBoxColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                englishDateTime.toString().split(" ")[0],
                style: const TextStyle(
                  color: AppColors.textDefaultColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const Divider(),
          const Text(
            "Hijri Date",
            style: TextStyle(
              color: AppColors.textDefaultColor,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: height / 80,
          ),
          Container(
            height: height / 16,
            width: width / 2,
            decoration: BoxDecoration(
              color: AppColors.functionalTextBoxColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                hijriDateTime.toString().split(" ")[0],
                style: const TextStyle(
                  color: AppColors.textDefaultColor,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
