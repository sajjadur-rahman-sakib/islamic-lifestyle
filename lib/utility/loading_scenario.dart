import 'package:flutter/material.dart';
import 'package:sakib/utility/app_colors.dart';
import 'package:sakib/utility/asset_paths.dart';

class LoadingScenario extends StatelessWidget {
  const LoadingScenario({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryBackgroundColor,
      child: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(
            AssetPaths.loadingGif,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
