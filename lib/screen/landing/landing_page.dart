import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deen/screen/dates/calendar_page.dart';
import 'package:deen/screen/home/home_page.dart';
import 'package:deen/screen/prayer/prayer_page.dart';
import 'package:deen/screen/qibla/qibla_page.dart';
import 'package:deen/screen/quran/quran_page.dart';
import 'package:deen/utility/app_colors.dart';
import 'package:deen/widget/current_location.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingState();
}

class _LandingState extends State<LandingPage> {
  CurrentLocation location = Get.put(CurrentLocation());

  int currentIndex = 2;
  final screens = [
    const Quran(),
    const Qibla(),
    const Home(),
    const Prayer(),
    const Calendar(),
  ];

  @override
  void initState() {
    _locationPermission();
    super.initState();
  }

  _locationPermission() async {
    location.currentLocation = await location.getCurrentLocation();
    await location.getAddressFromCoordinates();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.secondaryBackgroundColor,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/quran.png',
              height: width / 16,
              width: width / 16,
            ),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/qibla.png',
              height: width / 16,
              width: width / 16,
            ),
            label: "Qibla",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/home.png',
              height: width / 16,
              width: width / 16,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/prayer.png',
              height: width / 16,
              width: width / 16,
            ),
            label: "Prayer",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/calendar.png',
              height: width / 16,
              width: width / 16,
            ),
            label: "Dates",
          ),
        ],
        onTap: (index) => setState(() => currentIndex = index),
        selectedItemColor: AppColors.textDefaultColor,
        unselectedItemColor: AppColors.functionalTextBoxColor,
      ),
    );
  }
}
