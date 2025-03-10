import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sakib/control/full_surah_api_data.dart';

class FullSurahApiService {
  final FullSurahApiData _sharedPreferencesService = FullSurahApiData();

  Future<Map<String, dynamic>> getFullSurahDetails(String surahNo) async {
    final urlEnglish =
        Uri.parse('http://api.alquran.cloud/v1/surah/$surahNo/en.asad');
    final urlArabic = Uri.parse('http://api.alquran.cloud/v1/surah/$surahNo');

    try {
      String key = 'surah_$surahNo';
      Map<String, dynamic>? cachedData =
          await _sharedPreferencesService.getSurahData(key);

      if (cachedData != null) {
        return {
          'english': cachedData['english'],
          'arabic': cachedData['arabic'],
        };
      }

      var responseEnglish = await http.get(urlEnglish);
      var responseArabic = await http.get(urlArabic);

      if (responseEnglish.statusCode == 200 &&
          responseArabic.statusCode == 200) {
        final english = jsonDecode(responseEnglish.body);
        final arabic = jsonDecode(responseArabic.body);

        final surahData = {
          'english': english['data']['ayahs'],
          'arabic': arabic['data']['ayahs'],
        };

        await _sharedPreferencesService.saveSurahData(key, surahData);

        return surahData;
      } else {
        throw Exception('Failed to load surah');
      }
    } catch (e) {
      throw Exception('Failed to load surah');
    }
  }
}
