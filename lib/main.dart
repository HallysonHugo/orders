import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/homepage/view/homepage.dart';
import 'package:sport_bar/services/dio_connect.dart';

void main() {
  Get.put(DioConnect());
  runApp(
    const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage()
  ));
}

