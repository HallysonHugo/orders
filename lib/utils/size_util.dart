import 'package:flutter/material.dart';

class DeviceSize{
  
  static double getDeviceWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  static double getDeviceHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
}