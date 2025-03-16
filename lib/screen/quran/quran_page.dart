import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sakib/screen/quran/full_surah.dart';
import 'package:sakib/service/quran_surah_api_service.dart';
import 'package:sakib/utility/app_colors.dart';
import 'package:sakib/widget/loading_scenario.dart';
import 'package:sakib/widget/option_app_bar.dart';

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List<Map<String, String>> surah = [];
  int isPlaying = -1;
  bool playing = false;
  bool isLoading = true;
  final player = AudioPlayer();

  Future<void> fetchAllData() async {
    try {
      QuranSurahApiService api = QuranSurahApiService();
      surah = await api.getQuranSurahName();
    } catch (e) {
      return;
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void playAudio(int ii) async {
    if (playing) {
      await player.pause();
      setState(() {
        playing = false;
      });
      return;
    }
    playing = true;
    String index = (ii + 1).toString();
    String i;
    if (index.length == 1) {
      i = '00$index';
    } else if (index.length == 2) {
      i = '0$index';
    } else {
      i = index;
    }

    // ignore: unused_local_variable
    final duration =
        await player.setUrl('https://server6.mp3quran.net/thubti/$i.mp3');

    await player.play();
    setState(() {});
  }

  @override
  void initState() {
    fetchAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: optionAppBar("Quran"),
      body: isLoading
          ? const Center(
              child: LoadingScenario(),
            )
          : ListView.builder(
              itemCount: surah.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FullSurah(
                        name: surah[index]['engName'].toString(),
                        surahNo: surah[index]['number'].toString(),
                      ),
                    ),
                  );
                },
                child: Card(
                  color: AppColors.secondaryBackgroundColor,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        surah[index]['number'].toString(),
                      ),
                    ),
                    subtitle: Text(
                      surah[index]['name'].toString(),
                      style: const TextStyle(
                        color: AppColors.textDefaultColor,
                      ),
                    ),
                    title: Text(
                      surah[index]['engName'].toString(),
                      style: const TextStyle(
                        color: AppColors.textDefaultColor,
                      ),
                    ),
                    trailing: IconButton(
                      color: AppColors.iconDefaultColor,
                      onPressed: () {
                        setState(
                          () {
                            if (isPlaying != index) {
                              isPlaying = index;
                            } else {
                              isPlaying = -1;
                            }
                          },
                        );
                        playAudio(
                          (index),
                        );
                      },
                      icon: isPlaying == index
                          ? const Icon(Icons.pause)
                          : const Icon(
                              Icons.play_arrow,
                            ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
