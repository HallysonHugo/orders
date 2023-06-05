import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/produtos/model/produtos_model.dart';
import 'package:sport_bar/utils/color_formatter_utils.dart';
import 'package:sport_bar/utils/double_formatter.dart';
import 'package:sport_bar/widgets/buttons/custom_iconbutton.dart';
import 'package:sport_bar/widgets/products/products_card.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

import '../../utils/decoration_utils.dart';

class ListProductCard extends StatelessWidget {
  final void Function()? onTap;
  final bool canDelete;
  final ProdutosModel product;
  final void Function()? onDelete;
  const ListProductCard({super.key, this.onTap, this.canDelete = false, required this.product, this.onDelete});

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
        child: Row(
          children: [
            ImageProductCard(
              height: 200,
              width: 200,
              color: ColorFormatterUtils.formatStringToColor(color: product.color).obs,
              etiqueta: product.nomeEtiqueta?.obs ?? product.descricao.obs,
              produto: product,
              image: product.imagem.obs,
            ),
            DecorationUtils.DEFAULT_HSEPARATOR,
            DecorationUtils.DEFAULT_HSEPARATOR,
            Expanded(child: CustomText(text: product.descricao, color: Colors.black87, fontSize: 18,)),
            Expanded(child: CustomText(text: product.categoria.id.toString(), color: Colors.black87, fontSize: 18,)),
            Expanded(child: CustomText(
              text: DoubleFormatterUtil.doubleToString(value: product.estoque, isCurrency: false), 
              color: Colors.black87, 
              fontSize: 18,)),
            Expanded(child: CustomText(
              text: DoubleFormatterUtil.doubleToString(value:  product.preco), 
              color: Colors.grey, 
              fontSize: 18,)),
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
          ],
        ),
      ),
    );
  }
}