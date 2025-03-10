import 'package:shared_preferences/shared_preferences.dart';

class HomePageCheckboxValue {
  late SharedPreferences sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<Map<String, bool>> loadCheckboxValues(
      Map<String, bool> checkboxValues) async {
    Map<String, bool> loadedValues = {};
    checkboxValues.forEach((key, value) {
      loadedValues[key] = sharedPreferences.getBool(key) ?? value;
    });
    return loadedValues;
  }

  Future<void> saveCheckboxValue(String key, bool value) async {
    await sharedPreferences.setBool(key, value);
  }

  Future<void> resetCheckboxValues() async {
    await sharedPreferences.clear();
  }
}
