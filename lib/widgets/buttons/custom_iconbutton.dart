import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:sport_bar/utils/decoration_utils.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

class CustomIconButton extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final Color? color;
  final IconData? icon;
  final RxBool isLoading;
  const CustomIconButton({super.key, this.onTap, this.text, this.color, this.icon, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: isLoading.value == true ? null : onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                alignment: Alignment.center,
                child: Obx((){
                  if(isLoading.value == true){
                    return Row(
                      children: [
                        Lottie.asset('assets/animations/loading.json', width: 30, height: 30),
                        const CustomText(text: "Carregando", fontSize: 18, color: Colors.grey),
                      ],
                    );
                  }else{
                    return Row(
                      children: [
                      Icon(
                        icon, color: color ?? Colors.greenAccent[400], size: 30,),
                        DecorationUtils.DEFAULT_HSEPARATOR,
                        CustomText(text: text ?? "", fontSize: 18, color: Colors.grey),
                      ],
                    );
                  }
                }),
              ),
            );
  }
}