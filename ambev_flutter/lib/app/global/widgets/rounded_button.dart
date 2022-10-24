import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final void Function()? press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    this.text,
    this.press,
    this.color = Colors.cyan,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: Get.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            backgroundColor: color,
          ),
          onPressed: press,
          child: Text(
            text!,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
