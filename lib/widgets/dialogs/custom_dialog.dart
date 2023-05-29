import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/utils/decoration_utils.dart';
import 'package:sport_bar/widgets/buttons/custom_elevatedbutton.dart';
import 'package:sport_bar/widgets/buttons/custom_outlinedbutton.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

class CustomDialog{
  static Future sucessDialog({String? text})async{
    await Get.defaultDialog(
          title: "Sucesso",
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(text: text ?? "Operaçao realizada com sucesso", color: Colors.black87,),
              DecorationUtils.DEFAULT_VSEPARATOR,
              CustomElevatedButton(text: "Ok", onPressed: () => Get.back())
            ],  
          ),
      );
  }
  static Future erroDialog({String? text})async{
    await Get.defaultDialog(
          title: "Erro",
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(text: text ?? "Erro ao realizar a operação", color: Colors.black87,),
              DecorationUtils.DEFAULT_VSEPARATOR,
              CustomElevatedButton(text: "Ok", onPressed: () => Get.back())
            ],
          ),
        );
    }
    
    static Future questionDialog({String? text, Function()? onConfirm})async{
    await Get.defaultDialog(
          title: "Atenção",
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText(text: text ?? "Você deseja realizar esta operação?", color: Colors.black87,),
              DecorationUtils.DEFAULT_VSEPARATOR,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomElevatedButton(
                    text: "Confirmar", 
                    onPressed: onConfirm),
                  DecorationUtils.DEFAULT_HSEPARATOR,
                  CustomOutlinedButton(text: "Cancelar", onPressed: () => Get.back()),

                ],
              )
            ],
          ),
        );
    }
}