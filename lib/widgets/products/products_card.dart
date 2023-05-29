import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/produtos/model/produtos_model.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';


class ImageProductCard extends StatelessWidget {
  final ProdutosModel produto;
  final double height;
  final double width;
  final RxString image;
  final RxString etiqueta;
  final Rx<Color>? color;
  const ImageProductCard({super.key, required this.produto, this.height = 100, this.width = 100, 
  required this.image, required this.etiqueta, this.color});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
        return Container(
          decoration: BoxDecoration(
            color:  image.isEmpty ? setColor() : null,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
             Obx(() {
                if(image.isEmpty){
                  return Container(
                    height: height,
                    width: width,
                    child: Center(
                      child: 
                           Obx(
                             () {
                              return CustomText(text: etiqueta.value.isEmpty ? "Nome Label" : etiqueta.value, fontSize: 18, color: Colors.grey);
                            }
                          )
                      ),
                    
                  );
                }else{
                  return Image.file(
                    File(image.value),
                    height: height,
                    fit: BoxFit.contain,
                    width: width,
                  );
                }
               }
             ),
            ],
          ),
        );
      }
    );
  }
  setColor(){
    if(color != null){
      return color!.value;
    }else{
      return Colors.grey[200];
    }
  }
}