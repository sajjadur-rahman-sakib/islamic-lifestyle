import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:sakib/screen/home/option_button.dart';
import 'package:sakib/screen/home/prayer_time.dart';
import 'package:sakib/screen/maps/mosque_finder.dart';
import 'package:sakib/utility/app_colors.dart';
import 'package:sakib/widget/current_location.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var currentTime = DateFormat('hh:mm a').format(DateTime.now());
  var hijriDateTime = HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    String prayerName = 'No Prayer';
    String nextPrayer = 'No Prayer';

    final myCoordinates = Coordinates(
        currentLocation?.latitude ?? 23.727666597691943,
        currentLocation?.longitude ?? 90.41054998347452);
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);

    DateTime sunrise = prayerTimes.sunrise;
    DateTime sunriseSubtract = sunrise.subtract(const Duration(minutes: 1));

    DateTime asr = prayerTimes.asr;
    DateTime asrSubtract = asr.subtract(const Duration(minutes: 1));

    DateTime maghrib = prayerTimes.maghrib;
    DateTime maghribSubtract = maghrib.subtract(const Duration(minutes: 15));

    DateTime isha = prayerTimes.isha;
    DateTime ishaSubtract = isha.subtract(const Duration(minutes: 1));

    DateTime fajr = prayerTimes.fajr;
    DateTime fajrSubtract = fajr.subtract(const Duration(hours: 5));

    DateTime now = DateTime.now();

    if (now.isAfter(prayerTimes.fajr) && now.isBefore(sunriseSubtract)) {
      prayerName = 'Fajr';
      nextPrayer = 'Dhuhr';
    } else if (now.isAfter(sunrise) && now.isBefore(prayerTimes.dhuhr)) {
      prayerName = 'No Prayer';
      nextPrayer = 'Dhuhr';
    } else if (now.isAfter(prayerTimes.dhuhr) && now.isBefore(asrSubtract)) {
      prayerName = 'Dhuhr';
      nextPrayer = 'Asr';
    } else if (now.isAfter(prayerTimes.asr) && now.isBefore(maghribSubtract)) {
      prayerName = 'Asr';
      nextPrayer = 'Maghrib';
    } else if (now.isAfter(maghribSubtract) &&
        now.isBefore(prayerTimes.maghrib)) {
      prayerName = 'No Prayer';
      nextPrayer = 'Maghrib';
    } else if (now.isAfter(prayerTimes.maghrib) && now.isBefore(ishaSubtract)) {
      prayerName = 'Maghrib';
      nextPrayer = 'Isha';
    } else if (now.isAfter(fajrSubtract) && now.isBefore(prayerTimes.fajr)) {
      prayerName = 'No Prayer';
      nextPrayer = 'Fajr';
    } else {
      prayerName = 'Isha';
      nextPrayer = 'Fajr';
    }

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 30,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/home.jpg',
                  fit: BoxFit.cover,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 30, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () async {
                                currentLocation = await getCurrentLocation();
                                await getAddressFromCoordinates();
                              },
                              icon: Image.asset(
                                'assets/icons/location.png',
                                width: width / 18,
                                height: width / 18,
                                color: AppColors.textDefaultColor,
                              ),
                            ),
                            Text(
                              currentCityAddress,
                              style: const TextStyle(
                                color: AppColors.textDefaultColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.to(const MosqueFinder());
                              },
                              icon: Image.asset(
                                'assets/icons/maps.png',
                                width: width / 18,
                                height: width / 18,
                                color: AppColors.textDefaultColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            prayerName,
                            style: const TextStyle(
                                color: AppColors.textDefaultColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentTime,
                            style: const TextStyle(
                                color: AppColors.textDefaultColor,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Next Prayer : $nextPrayer',
                            style: const TextStyle(
                                color: AppColors.textDefaultColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          PrayerTime(
            hijriDateTime: hijriDateTime,
          ),
          const OptionButton(),
        ],
      ),
    );
  }
}
