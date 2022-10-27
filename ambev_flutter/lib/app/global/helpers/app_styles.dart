
import 'package:ambev_flutter/app/global/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static InputDecoration inputDecoration = InputDecoration(
    filled: true,
    fillColor: AppColors.light,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
    )
  );
}