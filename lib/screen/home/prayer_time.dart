import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sakib/widget/current_location.dart';
import 'package:sakib/widget/prayer_alarm.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({
    super.key,
    required this.hijriDateTime,
  });

  // ignore: prefer_typing_uninitialized_variables
  final hijriDateTime;

  @override
  PrayerTimeState createState() => PrayerTimeState();
}

class PrayerTimeState extends State<PrayerTime> {
  CurrentLocation location = Get.put(CurrentLocation());

  PrayerAlarm prayerAlarm = Get.put(PrayerAlarm());

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

    double height = MediaQuery.of(context).size.height;

    return Expanded(
      flex: 55,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 21, 26, 29),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.hijriDateTime.toFormat("MMMM dd yyyy"),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: height / 100),
              _prayerTimeRow(
                icon: const Icon(Icons.nights_stay_sharp, color: Colors.green),
                time: DateFormat.jm().format(prayerTimes.fajr),
                title: 'Shehri',
                alarmTime: DateFormat.jm().format(prayerTimes.fajr),
                prayerName: 'Shehri',
              ),
              _prayerTimeRow(
                icon: const Icon(Icons.sunny_snowing, color: Colors.brown),
                time: DateFormat.jm().format(prayerTimes.maghrib),
                title: 'Iftar',
                alarmTime: DateFormat.jm().format(prayerTimes.maghrib),
                prayerName: 'Iftar',
              ),
              _prayerTimeRow(
                icon: const Icon(Icons.wb_sunny, color: Colors.greenAccent),
                time: '${fajrStart.trim()} - ${fajrEnd.trim()}',
                title: 'Fajr',
                alarmTime: fajrStart.trim(),
                prayerName: 'Fajr',
              ),
              _prayerTimeRow(
                icon: const Icon(Icons.brightness_high, color: Colors.yellow),
                time: '${dhuhrStart.trim()} - ${dhuhrEnd.trim()}',
                title: 'Dhuhr',
                alarmTime: dhuhrStart.trim(),
                prayerName: 'Dhuhr',
              ),
              _prayerTimeRow(
                icon: const Icon(Icons.brightness_medium, color: Colors.blue),
                time: '${asrStart.trim()} - ${asrEnd.trim()}',
                title: 'Asr',
                alarmTime: asrStart.trim(),
                prayerName: 'Asr',
              ),
              _prayerTimeRow(
                icon: const Icon(Icons.sunny_snowing, color: Colors.blueGrey),
                time: '${maghribStart.trim()} - ${maghribEnd.trim()}',
                title: 'Maghrib',
                alarmTime: maghribStart.trim(),
                prayerName: 'Maghrib',
              ),
              _prayerTimeRow(
                icon: const Icon(Icons.nightlight_round_sharp,
                    color: Colors.deepPurple),
                time: '${ishaStart.trim()} - ${ishaEnd.trim()}',
                title: 'Isha',
                alarmTime: ishaStart.trim(),
                prayerName: 'Isha',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _prayerTimeRow({
    required Icon icon,
    required String time,
    required String title,
    required String alarmTime,
    required String prayerName,
  }) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      child: Row(
        children: [
          icon,
          SizedBox(width: width / 20),
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          const Spacer(),
          Text(
            time,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(width: width / 30),
          IconButton(
            onPressed: () {
              DateTime alarmDateTime = DateFormat.jm().parse(alarmTime);
              int hour = alarmDateTime.hour;
              int minute = alarmDateTime.minute;
              prayerAlarm.setAlarm(hour, minute, prayerName);
              debugPrint('Alarm set for $hour:$minute');
            },
            icon: const Icon(
              Icons.alarm,
              color: Colors.white54,
            ),
          )
        ],
      ),
    );
  }
}
