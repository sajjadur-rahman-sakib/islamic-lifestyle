import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sakib/control/quran_surah_api_data.dart';

class QuranSurahApiService {
  final QuranSurahApiData _sharedPreferencesHelper = QuranSurahApiData();

  Future<List<Map<String, String>>> getQuranSurahName() async {
    List<Map<String, String>> surah = [];

    List<Map<String, String>>? cachedData =
        await _sharedPreferencesHelper.getSurahData();

    if (cachedData != null) {
      return cachedData;
    }

    try {
      var url = Uri.parse('http://api.alquran.cloud/v1/surah');
      var response = await http.get(url);

      final data = jsonDecode(response.body);
      List<Map<String, String>> tempSurah = [];

      for (var e in (data['data'] as List<dynamic>)) {
        tempSurah.add({
          'number': e['number'].toString(),
          'name': e['name'].toString(),
          'engName': e['englishName'].toString(),
          'ayhs': e['numberOfAyahs'].toString(),
          'revelationType': e['revelationType'].toString()
        });
      }

      await _sharedPreferencesHelper.saveSurahData(tempSurah);

      surah = tempSurah;
    } catch (e) {
      throw Exception("Error fetching surah data");
    }

    return surah;
  }
}
