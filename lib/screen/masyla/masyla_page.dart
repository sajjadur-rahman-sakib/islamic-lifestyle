import 'package:flutter/material.dart';
import 'package:sakib/screen/duas/duas_details.dart';
import 'package:sakib/utility/app_colors.dart';
import 'package:sakib/widget/option_app_bar.dart';

class Masyla extends StatefulWidget {
  const Masyla({super.key});

  @override
  State<Masyla> createState() => _MasylaState();
}

class _MasylaState extends State<Masyla> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      appBar: optionAppBar('Masyla'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: AppColors.primaryBackgroundColor,
                    title: Text(
                      items[index],
                      style: const TextStyle(color: AppColors.textDefaultColor),
                    ),
                    content: Text(
                      duas[index],
                      style: const TextStyle(color: AppColors.textDefaultColor),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'OK',
                          style: TextStyle(color: AppColors.textDefaultColor),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryBackgroundColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/people.png',
                      color: AppColors.iconDefaultColor,
                      height: height / 30,
                      width: width / 10,
                    ),
                    SizedBox(height: height / 80),
                    Text(
                      items[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.textDefaultColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
