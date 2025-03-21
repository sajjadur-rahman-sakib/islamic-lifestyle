import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sakib/screen/dates/calendar_page.dart';
import 'package:sakib/screen/home/home_page.dart';
import 'package:sakib/screen/prayer/prayer_page.dart';
import 'package:sakib/screen/qibla/qibla_page.dart';
import 'package:sakib/screen/quran/quran_page.dart';
import 'package:sakib/widget/current_location.dart';

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
        backgroundColor: const Color.fromRGBO(20, 30, 40, 20),
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
        selectedItemColor: const Color.fromRGBO(200, 220, 240, 20),
        unselectedItemColor: const Color.fromRGBO(183, 220, 240, 10),
      ),
    );
  }
}
