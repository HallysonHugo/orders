import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/produtos/model/produtos_model.dart';
import 'package:sport_bar/utils/decoration_utils.dart';
import 'package:sport_bar/utils/double_formatter.dart';
import 'package:sport_bar/widgets/products/products_card.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

import '../../utils/color_formatter_utils.dart';
import '../buttons/custom_iconbutton.dart';

class GridProductCard extends StatelessWidget {
  final ProdutosModel product;
  final void Function()? onTap;
  final bool canDelete;
  final void Function()? onDelete;
  const GridProductCard({super.key, required this.product, this.onTap, this.canDelete = false, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
              decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    child: ImageProductCard(
                      color: ColorFormatterUtils.formatStringToColor(color: product.color).obs,
                      etiqueta: product.nomeEtiqueta?.obs ?? product.descricao.obs,
                      produto: product,
                      image: product.imagem.obs,
                    ),
                  ),
                  DecorationUtils.DEFAULT_HSEPARATOR,
                  DecorationUtils.DEFAULT_HSEPARATOR,
                  CustomText(text: product.descricao, color: Colors.black87, fontSize: 18,),
                  CustomText(text: product.categoria.id.toString(), color: Colors.black87, fontSize: 18,),
                  CustomText(
                    text: DoubleFormatterUtil.doubleToString(value: product.estoque, isCurrency: false), 
                    color: Colors.black87, 
                    fontSize: 18,),
                  CustomText(
                    text: DoubleFormatterUtil.doubleToString(value:  product.preco), 
                    color: Colors.grey, 
                    fontSize: 18,),
                  if(canDelete)...[
                    CustomIconButton(
                      isLoading: false.obs, 
                      icon: Icons.delete, 
                      color: Colors.red,
                      onTap: onDelete
                    ),
                    DecorationUtils.DEFAULT_HSEPARATOR,
                    DecorationUtils.DEFAULT_HSEPARATOR, 
                  ]
                  // ListTile(
                  //   title: CustomText(text: products.value.data![index].descricao, color: Colors.black87, fontSize: 18,),
                  //   subtitle: CustomText(text: DoubleFormatterUtil.doubleToString(value:  products.value.data![index].preco), color: Colors.grey, fontSize: 18,),
                  //   leading: ImageProductCard(
                  //     color: ColorFormatterUtils.formatStringToColor(color: products.value.data![index].color).obs,
                  //     etiqueta: products.value.data![index].nomeEtiqueta == null ? products.value.data![index].descricao.obs :
                  //     products.value.data![index].nomeEtiqueta!.obs,
                  //     produto: products.value.data![index],
                  //     image: products.value.data![index].imagem.obs,
                  //   ),
                  // ),
                ],
              ),
            ),
      );
    }
}