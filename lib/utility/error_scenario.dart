import 'package:flutter/material.dart';
import 'package:sakib/utility/app_colors.dart';
import 'package:sakib/utility/asset_paths.dart';

class ErrorScenario extends StatelessWidget {
  const ErrorScenario({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryBackgroundColor,
      child: Center(
        child: Image.asset(
          AssetPaths.errorGif,
          color: Colors.white,
        ),
      ),
    );
  }
}
