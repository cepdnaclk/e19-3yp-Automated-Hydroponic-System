import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackbar(String message, {bool isError = true, String title = "Error"}) {
  Color titleColor = title == "Congratulations !!!" ? Color(0xFF0D7817) : Colors.redAccent;

  Get.snackbar(title, message,
    titleText: Text(
      title,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 17,
        color: titleColor,
      ),
    ),
    messageText: Text(
      message,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.black,
      ),
    ),
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    backgroundColor: Colors.white,
  );
}
