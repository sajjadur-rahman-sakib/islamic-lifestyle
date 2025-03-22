import 'package:flutter/material.dart';
import 'package:sakib/screen/home/all_buttons.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 25,
      child: Container(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
        color: const Color.fromARGB(255, 21, 26, 29),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTasbihButton(context),
                buildPrayerButton(context),
                buildQuranButton(context),
                buildQiblaButton(context),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildZakatButton(context),
                buildMapsButton(context),
                buildKalimaButton(context),
                buildDatesButton(context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
