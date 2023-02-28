import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final double? width;
  final String? hintText;
  final bool isCurrency;
  final String? label;
  final Icon? suffixIcon;
  const CustomTextField({super.key, this.onChanged, this.controller,  this.hintText, this.width, this.isCurrency = false, this.label, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: width ?? 300,
          child: TextField(
              inputFormatters: [
                if(isCurrency)...[
                  FilteringTextInputFormatter.digitsOnly,
                  CentavosInputFormatter(moeda: true)
                ]
              ],
              controller: controller,
              onChanged: onChanged,
              decoration:  InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                hintText: hintText,
                label: label == null ? null : CustomText(text: label!, fontSize: 16, color: Colors.grey,),
                suffixIcon: suffixIcon,
              ),
            ),
        )
      ],
    );
  }
}