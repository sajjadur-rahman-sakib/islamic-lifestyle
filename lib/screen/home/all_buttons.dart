import 'package:flutter/material.dart';
import 'package:sakib/screen/dates/calendar_page.dart';
import 'package:sakib/screen/maps/mosque_finder.dart';
import 'package:sakib/screen/prayer/prayer_page.dart';
import 'package:sakib/screen/qibla/qibla_page.dart';
import 'package:sakib/screen/quran/quran_page.dart';
import 'package:sakib/screen/tasbih/tasbih_page.dart';
import 'package:sakib/screen/zakat/zakat_page.dart';

Widget buildMapsButton(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  return SizedBox(
    height: height / 12,
    width: width / 5,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MosqueFinder(),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/maps.png',
            height: height / 30,
            width: height / 30,
          ),
          const SizedBox(height: 4),
          const Text(
            'Mosque',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildZakatButton(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  return SizedBox(
    height: height / 12,
    width: width / 5,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Zakat(),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/zakat.png',
            height: height / 30,
            width: height / 30,
          ),
          const SizedBox(height: 4),
          const Text(
            'Zakat',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildDatesButton(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  return SizedBox(
    height: height / 12,
    width: width / 5,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Calendar(),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/calendar.png',
            height: height / 30,
            width: height / 30,
          ),
          const SizedBox(height: 4),
          const Text(
            'Dates',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildMasylaButton(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  return SizedBox(
    height: height / 12,
    width: width / 5,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MosqueFinder(),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/masyla.png',
            height: height / 30,
            width: height / 30,
          ),
          const SizedBox(height: 4),
          const Text(
            'Masyla',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildTasbihButton(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  return SizedBox(
    height: height / 12,
    width: width / 5,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Tasbih(),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/tasbih.png',
            height: height / 30,
            width: height / 30,
          ),
          const SizedBox(height: 4),
          const Text(
            'Tasbih',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildQuranButton(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  return SizedBox(
    height: height / 12,
    width: width / 5,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Quran(),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/quran.png',
            height: height / 30,
            width: height / 30,
          ),
          const SizedBox(height: 4),
          const Text(
            'Quran',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildPrayerButton(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  return SizedBox(
    height: height / 12,
    width: width / 5,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Prayer(),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/prayer.png',
            height: height / 30,
            width: height / 30,
          ),
          const SizedBox(height: 4),
          const Text(
            'Prayer',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildQiblaButton(BuildContext context) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  return SizedBox(
    height: height / 12,
    width: width / 5,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(10),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Qibla(),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/qibla.png',
            height: height / 30,
            width: height / 30,
          ),
          const SizedBox(height: 4),
          const Text(
            'Qibla',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}
