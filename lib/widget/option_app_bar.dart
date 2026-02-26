import 'package:flutter/material.dart';
import 'package:deen/utility/app_colors.dart';

AppBar optionAppBar(String title) {
  return AppBar(
    backgroundColor: AppColors.primaryBackgroundColor,
    title: Text(
      title,
      style: const TextStyle(
        color: AppColors.textDefaultColor,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.iconDefaultColor),
    centerTitle: true,
  );
}
