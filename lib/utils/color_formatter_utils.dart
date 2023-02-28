import 'package:flutter/material.dart';

class ColorFormatterUtils{
  static String? formatColor({Color? color}) {
    if(color == null) {
      return null;
    }
    return '#${color.value.toRadixString(16).substring(2)}';
  }

  static Color formatStringToColor({String? color}) {
    if(color == null) {
      return Colors.white;
    }
    return Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000);
  }
}