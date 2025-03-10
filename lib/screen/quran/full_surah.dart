import 'package:flutter/material.dart';
import 'package:sakib/service/full_surah_api_service.dart';
import 'package:sakib/utility/app_colors.dart';
import 'package:sakib/utility/loading_scenario.dart';

class FullSurah extends StatefulWidget {
  const FullSurah({
    super.key,
    required this.name,
    required this.surahNo,
  });

  final String surahNo;
  final String name;

  @override
  State<FullSurah> createState() => _FullSurahState();
}

class _FullSurahState extends State<FullSurah> {
  final FullSurahApiService apiService = FullSurahApiService();
  List<Map<String, String>> ayah = [];
  List<Map<String, String>> ayahArabic = [];
  bool isLoading = true; // Added this line

  Future<void> getSurah() async {
    try {
      final surahData = await apiService.getFullSurahDetails(widget.surahNo);

      for (var e in (surahData['english'] as List<dynamic>)) {
        ayah.add({
          e['numberInSurah'].toString(): e['text'].toString(),
          'numberInQuran': e['number'].toString(),
          'juz': e['juz'].toString(),
          'manzil': e['manzil'].toString(),
          'page': e['page'].toString(),
          'ruku': e['ruku'].toString(),
          'hizbQuarter': e['hizbQuarter'].toString(),
          'sajda': e['sajda'].toString()
        });
      }

      for (var e in (surahData['arabic'] as List<dynamic>)) {
        ayahArabic.add({e['numberInSurah'].toString(): e['text'].toString()});
      }
    } catch (e) {
      return;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void openDetails(BuildContext context, Map<String, String> data) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          )
        ],
        content: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Ayah Number in Quran: ${data['numberInQuran']}'),
              Text('Juz: ${data['juz']}'),
              Text('Manzil: ${data['manzil']}'),
              Text('Page Number: ${data['page']}'),
              Text('Ruku: ${data['ruku']}'),
              Text('Hizb Quarter: ${data['hizbQuarter']}'),
              Text('Sajda: ${data['sajda']}'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getSurah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: isLoading
          ? const Center(
              child: LoadingScenario(),
            )
          : Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: ayah.length,
                itemBuilder: (context, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      onTap: () {
                        var datas = {
                          'numberInQuran':
                              ayah[index]['numberInQuran'].toString(),
                          'juz': ayah[index]['juz'].toString(),
                          'manzil': ayah[index]['manzil'].toString(),
                          'page': ayah[index]['page'].toString(),
                          'ruku': ayah[index]['ruku'].toString(),
                          'hizbQuarter': ayah[index]['hizbQuarter'].toString(),
                          'sajda': ayah[index]['sajda'].toString(),
                        };
                        openDetails(context, datas);
                      },
                      subtitle: Text(
                        ayah[index][(index + 1).toString()].toString(),
                        style: const TextStyle(
                          color: AppColors.textDefaultColor,
                        ),
                      ),
                      title: Text(
                        ayahArabic[index][(index + 1).toString()].toString(),
                        style: const TextStyle(
                          color: AppColors.textDefaultColor,
                        ),
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
    );
  }
}
