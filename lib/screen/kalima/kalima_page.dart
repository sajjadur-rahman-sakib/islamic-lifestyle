import 'package:flutter/material.dart';
import 'package:sakib/screen/kalima/kalima_details.dart';
import 'package:sakib/utility/app_colors.dart';
import 'package:sakib/widget/option_app_bar.dart';

class KalimaPage extends StatelessWidget {
  KalimaPage({super.key});

  final List<String> kalima = [
    "Kalimah Tayyibah",
    "Kalimah Shahadah",
    "Kalimah Tamjeed",
    "Kalimah Tawheed",
    "Kalimah Istighfar",
    "Kalimah Radde Kufr"
  ];

  final List<String> arabic = [
    "لَا إِلٰهَ إِلَّا اللَّهُ مُحَمَّدٌ رَسُولُ اللَّهِ",
    "أَشْهَدُ أَنْ لَا إِلٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ",
    "سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ وَلَا إِلٰهَ إِلَّا اللَّهُ وَاللَّهُ أَكْبَرُ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ",
    "لَا إِلٰهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ يُحْيِي وَيُمِيتُ وَهُوَ حَيٌّ لَا يَمُوتُ أَبَدًا أَبَدًا ذُو الْجَلَالِ وَالْإِكْرَامِ بِيَدِهِ الْخَيْرُ وَهُوَ عَلَىٰ كُلِّ شَيْءٍ قَدِيرٌ",
    "أَسْتَغْفِرُ اللَّهَ رَبِّي مِنْ كُلِّ ذَنْبٍ أَذْنَبْتُهُ عَمَدًا أَوْ خَطَأً سِرًّا أَوْ عَلَانِيَةً وَأَتُوبُ إِلَيْهِ مِنْ الذَّنْبِ الَّذِي أَعْلَمُ وَمِنَ الذَّنْبِ الَّذِي لَا أَعْلَمُ إِنَّكَ أَنْتَ عَلَّامُ الْغُيُوبِ وَسَتَّارُ الْعُيُوبِ وَغَفَّارُ الذُّنُوبِ وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ",
    "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ أَنْ أُشْرِكَ بِكَ شَيْئًا وَأَنَا أَعْلَمُ بِهِ وَأَسْتَغْفِرُكَ لِمَا لَا أَعْلَمُ بِهِ تُبْتُ عَنْهُ وَتَبَرَّأْتُ مِنَ الْكُفْرِ وَالشِّرْكِ وَالْكِذْبِ وَالْغِيبَةِ وَالْبِدْعَةِ وَالنَّمِيمَةِ وَالْفَوَاحِشِ وَالْبُهْتَانِ وَالْمَعَاصِي كُلِّهَا وَأَسْلَمْتُ وَقُلْتُ لَا إِلٰهَ إِلَّا اللَّهُ مُحَمَّدٌ رَسُولُ اللَّهِ"
  ];

  final List<String> english = [
    "Lā ilāha illallāhu Muḥammadur Rasūlullāh",
    "Ashhadu an lā ilāha illallāhu waḥdahu lā sharīka lahu wa ashhadu anna Muḥammadan ʿabduhu wa rasūluh",
    "Subḥānallāhi walḥamdu lillāhi wa lā ilāha illallāhu wallāhu akbar, wa lā ḥawla wa lā quwwata illā billāh",
    "Lā ilāha illallāhu waḥdahu lā sharīka lahu, lahu al-mulku wa lahu al-ḥamdu yuḥyī wa yumītu wa huwa ḥayyul lā yamūtu abadan abada, dhūl-jalāli wal-ikrām, biyadihi al-khayr wa huwa ʿalā kulli shayʾin qadīr",
    "Astaghfirullāha rabbī min kulli dhanbin adhnabtuhu ʿamdan aw khaṭaʾan sirran aw ʿalāniyatan wa atūbu ilayhi min adh-dhanbi alladhī aʿlamu wa min adh-dhanbi alladhī lā aʿlamu, innaka anta ʿallāmul-ghuyūb, wa sattārul-ʿuyūb, wa ghaffārudh-dhunūb, wa lā ḥawla wa lā quwwata illā billāh",
    "Allāhumma innī aʿūdhu bika min an ushrika bika shayʾan wa anā aʿlamu bihi, wa astaghfiruka limā lā aʿlamu bihi, tubtu ʿanhu wa tabarraʾtu minal-kufri wash-shirki wal-kadhibi wal-ghībati wal-bidʿati wan-namīmati wal-fawāḥishi wal-buhtāni wal-maʿāṣī kullihā, wa aslamtu wa qultu lā ilāha illallāhu Muḥammadur Rasūlullāh"
  ];

  final List<String> translation = [
    "There is no god but Allah, and Muhammad is the Messenger of Allah.",
    "I bear witness that there is no god but Allah, He is One and has no partner, and I bear witness that Muhammad is His servant and Messenger.",
    "Glory be to Allah, all praise be to Allah, there is no god but Allah, and Allah is the Greatest. There is no power and no strength except with Allah.",
    "There is no god but Allah. He is One and has no partner. His is the kingdom, and His is the praise. He gives life and causes death, and He is Ever-Living and does not die. In His hand is all good, and He has power over everything.",
    "I seek forgiveness from Allah, my Lord, for all my sins, whether I committed them knowingly or unknowingly, secretly or openly. I turn to Him in repentance for the sins I know and the sins I do not know. Surely, You are the Knower of the unseen, the Concealer of faults, and the Forgiver of sins. There is no power and no strength except with Allah.",
    "O Allah! I seek refuge in You from associating anything with You knowingly, and I seek Your forgiveness for what I do not know. I repent from it and reject disbelief, polytheism, falsehood, backbiting, innovation, slander, immorality, false accusations, and all sins. I submit to You and declare: There is no god but Allah, and Muhammad is the Messenger of Allah."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: optionAppBar("Kalima"),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: kalima.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => KalimaDetails(
                        title: kalima[index],
                        arabic: arabic[index],
                        english: english[index],
                        translation: translation[index],
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryBackgroundColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: Text(
                      (index + 1).toString().padLeft(2, '0'),
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.textDefaultColor,
                      ),
                    ),
                    title: Text(
                      kalima[index],
                      style: const TextStyle(
                        fontSize: 20,
                        color: AppColors.textDefaultColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Added spacing
            ],
          );
        },
      ),
    );
  }
}
