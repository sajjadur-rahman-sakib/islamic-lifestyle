import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class FullSurahApiData {
  Future<void> saveSurahData(String key, Map<String, dynamic> data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, jsonEncode(data));
  }

  Future<Map<String, dynamic>?> getSurahData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? cachedData = sharedPreferences.getString(key);
    return cachedData != null ? jsonDecode(cachedData) : null;
  }
}
