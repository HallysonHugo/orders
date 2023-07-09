import 'package:flutter/material.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

class CustomCircledButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  const CustomCircledButton({super.key, required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(icon, color: Colors.black87, size: 20),
            ),
            CustomText(text: text)
          ],
        ),
      );
  }
}