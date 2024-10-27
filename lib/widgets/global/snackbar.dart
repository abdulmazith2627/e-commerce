

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void snack(
  {
    required String title,
    required String  message,
  }
){
Get.showSnackbar(
    GetSnackBar(
    title:title,
    message:message,
    duration:const Duration(seconds: 3),
  ),
); 
}