import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final double? width;
  final double? height;
  const CustomOutlinedButton({super.key, this.onPressed, required this.text, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? (){
        Get.back();
      },
      child: Container(
        alignment: Alignment.center,
        width: width ?? 200,
        height: height ?? 50,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: CustomText(text: text, color: Colors.red ),
      ),
    );
  }
}