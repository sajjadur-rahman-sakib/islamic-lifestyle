import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PrayerAlarm extends GetxController {
  void setAlarm(int hour, int minute, String prayer) async {
    final intent = AndroidIntent(
      action: 'android.intent.action.SET_ALARM',
      arguments: {
        'android.intent.extra.alarm.HOUR': hour,
        'android.intent.extra.alarm.MINUTES': minute,
        'android.intent.extra.alarm.MESSAGE': prayer,
        'android.intent.extra.alarm.SKIP_UI': false,
      },
      flags: [Flag.FLAG_ACTIVITY_NEW_TASK],
    );

    await intent.launch();
  }
}
