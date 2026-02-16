import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sakib/screen/prayer/prayer_time.dart';
import 'package:sakib/utility/app_colors.dart';
import 'package:sakib/widget/option_app_bar.dart';

class Prayer extends StatefulWidget {
  const Prayer({super.key});

  @override
  State<Prayer> createState() => _PrayerState();
}

class _PrayerState extends State<Prayer> {
  var currentTime = DateFormat('hh:mm a').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: optionAppBar('Prayer Time'),
      body: Column(
        children: [
          SizedBox(
            height: height / 5.5,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentTime,
                  style: const TextStyle(
                    color: AppColors.textDefaultColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.secondaryBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: const PrayerTime(),
            ),
          )
        ],
      ),
    );
  }
}
