import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sakib/utility/app_colors.dart';
import 'package:sakib/widget/current_location.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({super.key});

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  CurrentLocation location = Get.put(CurrentLocation());

  @override
  void initState() {
    super.initState();
    fetchLocationData();
  }

  void fetchLocationData() async {
    location.currentLocation = await location.getCurrentLocation();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final myCoordinates = Coordinates(
        location.currentLocation?.latitude ?? 23.727666597691943,
        location.currentLocation?.longitude ?? 90.41054998347452);
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    final prayerTimes = PrayerTimes.today(myCoordinates, params);

    var fajrStart = DateFormat.jm().format(prayerTimes.fajr);
    DateTime sunrise = prayerTimes.sunrise;
    DateTime sunriseSubtract = sunrise.subtract(const Duration(minutes: 1));
    var fajrEnd = DateFormat.jm().format(sunriseSubtract);

    var dhuhrStart = DateFormat.jm().format(prayerTimes.dhuhr);
    DateTime asr = prayerTimes.asr;
    DateTime asrSubtract = asr.subtract(const Duration(minutes: 1));
    var dhuhrEnd = DateFormat.jm().format(asrSubtract);

    var asrStart = DateFormat.jm().format(prayerTimes.asr);
    DateTime maghrib = prayerTimes.maghrib;
    DateTime maghribSubtract = maghrib.subtract(const Duration(minutes: 15));
    var asrEnd = DateFormat.jm().format(maghribSubtract);

    var maghribStart = DateFormat.jm().format(prayerTimes.maghrib);
    DateTime isha = prayerTimes.isha;
    DateTime ishaSubtract = isha.subtract(const Duration(minutes: 1));
    var maghribEnd = DateFormat.jm().format(ishaSubtract);

    var ishaStart = DateFormat.jm().format(prayerTimes.isha);
    DateTime fajr = prayerTimes.fajr;
    DateTime fajrSubtract = fajr.subtract(const Duration(hours: 5));
    var ishaEnd = DateFormat.jm().format(fajrSubtract);

    var sunriseTime = DateFormat.jm().format(prayerTimes.sunrise);
    var sunsetTime = DateFormat.jm().format(prayerTimes.maghrib);

    var firstForbiddenStart = DateFormat.jm().format(prayerTimes.sunrise);
    DateTime forFirstForbidden = sunrise.add(const Duration(minutes: 15));
    var firstForbiddenEnd = DateFormat.jm().format(forFirstForbidden);

    var secondForbiddenEnd = DateFormat.jm().format(prayerTimes.dhuhr);
    DateTime dhuhr = prayerTimes.dhuhr;
    DateTime forSecondForbidden = dhuhr.subtract(const Duration(minutes: 7));
    var secondForbiddenStart = DateFormat.jm().format(forSecondForbidden);

    var thirdForbiddenEnd = DateFormat.jm().format(prayerTimes.maghrib);
    DateTime forThirdForbidden = maghrib.subtract(const Duration(minutes: 15));
    var thirdForbiddenStart = DateFormat.jm().format(forThirdForbidden);

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        buildNameAndTime(
          context,
          'Fajr',
          '${fajrStart.trim()} - ${fajrEnd.trim()}',
        ),
        buildNameAndTime(
          context,
          'Sunrise',
          sunriseTime,
        ),
        buildNameAndTime(
          context,
          'Forbidden Time',
          '${firstForbiddenStart.trim()} - ${firstForbiddenEnd.trim()}',
        ),
        buildNameAndTime(
          context,
          'Salatul Duha',
          '${firstForbiddenEnd.trim()} - ${secondForbiddenStart.trim()}',
        ),
        buildNameAndTime(
          context,
          'Forbidden Time',
          '${secondForbiddenStart.trim()} - ${secondForbiddenEnd.trim()}',
        ),
        buildNameAndTime(
          context,
          'Dhuhr',
          '${dhuhrStart.trim()} - ${dhuhrEnd.trim()}',
        ),
        buildNameAndTime(
          context,
          'Asr',
          '${asrStart.trim()} - ${asrEnd.trim()}',
        ),
        buildNameAndTime(
          context,
          'Forbidden Time',
          '${thirdForbiddenStart.trim()} - ${thirdForbiddenEnd.trim()}',
        ),
        buildNameAndTime(
          context,
          'Sunset',
          sunsetTime,
        ),
        buildNameAndTime(
          context,
          'Maghrib',
          '${maghribStart.trim()} - ${maghribEnd.trim()}',
        ),
        buildNameAndTime(
          context,
          'Isha',
          '${ishaStart.trim()} - ${ishaEnd.trim()}',
        ),
      ],
    );
  }
}

Widget buildNameAndTime(BuildContext context, String name, String time) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.functionalTextBoxColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        title: Text(
          name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        trailing: Text(
          time,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    ),
  );
}
