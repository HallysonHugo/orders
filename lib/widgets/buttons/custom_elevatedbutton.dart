import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Function()? onPressed; 
  
  const CustomElevatedButton({super.key, required this.text, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.greenAccent[400],
          borderRadius: BorderRadius.circular(10),
        ),
        child: CustomText(
          text:text
        ),
      ),
    );
  }
}