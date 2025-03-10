import 'package:shared_preferences/shared_preferences.dart';

class QiblaCompassStateData {
  static const String _qiblaAngleKey = 'qibla_angle';

  static Future<void> saveQiblaAngle(double angle) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_qiblaAngleKey, angle);
  }

  static Future<double> loadQiblaAngle() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(_qiblaAngleKey) ?? 0.0;
  }
}
