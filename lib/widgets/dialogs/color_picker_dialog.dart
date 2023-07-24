import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sport_bar/widgets/buttons/custom_elevatedbutton.dart';

class ColorPickerDialog{
  static colorPickerDialog(){
    Color color = Colors.white;
    return Get.defaultDialog(
      title: "Escolha uma cor",
      titleStyle: GoogleFonts.raleway(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ColorPicker(pickerColor: color, onColorChanged: (colorSelected){
            color =  colorSelected;
          }),
          CustomElevatedButton(text: "Confirmar", onPressed: (){
            Get.back(result: color);
          })
        ],
      )
    );
  }
}