
import 'package:ambev_flutter/app/global/helpers/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Helpers {
  static confirm({
    required String title,
    required String message,
    required String backText,
    required Color confirmColor,
    required String confirmText,
    required BuildContext context,
  }) {
    return Get.defaultDialog(
      title: title,
      middleText: message,
      confirm: TextButton(
        onPressed: () {
          Get.back(
            result: true,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: confirmColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              confirmText,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      cancel: TextButton(
        onPressed: () {
          Get.back(
            result: false,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.medium,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              backText,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static String handleWheres(Map<String, dynamic> wheres) {
    var query = '?';
    int count = 0;
    wheres.forEach((key, value) {
      if (count == 0) {
        query = "$query$key=$value";
      } else {
        query = "$query&$key=$value";
      }
      count++;
    });

    return query;
  }

  static toast(
      {required String title,
      required String message,
      Color? color,
      Color? backgroundColor}) async {
    // ignore: prefer_conditional_assignment
    if (color == null) {
      color = Colors.white;
    }

    // ignore: prefer_conditional_assignment
    if (backgroundColor == null) {
      backgroundColor = AppColors.primary;
    }

    if (Get.isSnackbarOpen) return;

    Get.snackbar(title, message,
        colorText: color, backgroundColor: backgroundColor);
  }
}