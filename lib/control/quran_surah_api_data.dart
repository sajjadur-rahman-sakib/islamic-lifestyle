import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class QuranSurahApiData {
  static const String _surahKey = 'surah_data';

  Future<void> saveSurahData(List<Map<String, String>> data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_surahKey, jsonEncode(data));
  }

  Future<List<Map<String, String>>?> getSurahData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey(_surahKey)) {
      String? surahData = sharedPreferences.getString(_surahKey);
      if (surahData != null) {
        List<dynamic> decodedData = jsonDecode(surahData);
        return decodedData
            .map(
              (e) => {
                'number': e['number'].toString(),
                'name': e['name'].toString(),
                'engName': e['engName'].toString(),
                'ayhs': e['ayhs'].toString(),
                'revelationType': e['revelationType'].toString()
              },
            )
            .toList();
      }
    }
    return null;
  }
}
