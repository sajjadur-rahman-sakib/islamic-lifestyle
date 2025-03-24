import 'package:flutter/material.dart';
import 'package:sakib/utility/app_colors.dart';
import 'package:sakib/widget/option_app_bar.dart';

class KalimaDetails extends StatelessWidget {
  final String title;
  final String arabic;
  final String english;
  final String translation;

  const KalimaDetails({
    super.key,
    required this.title,
    required this.arabic,
    required this.english,
    required this.translation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: optionAppBar(title),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.secondaryBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  arabic,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.textDefaultColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                Text(
                  translation,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.textDefaultColor,
                  ),
                ),
                const Divider(),
                Text(
                  translation,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    color: AppColors.textDefaultColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
