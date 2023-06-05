import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/vendas/model/cart_model.dart';
import 'package:sport_bar/modules/vendas/model/itvendas_model.dart';
import 'package:sport_bar/utils/color_formatter_utils.dart';
import 'package:sport_bar/utils/extensions.dart';
import 'package:sport_bar/widgets/products/products_card.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

class ProductCartCard extends StatelessWidget {
  final ItVendas product;
  final double? height;
  final double? width;
  const ProductCartCard({super.key, required this.product, this.height, this.width});
  

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          ImageProductCard(
            height: height ?? 100,
            width: width ?? 100,
            color: ColorFormatterUtils.formatStringToColor(color: product.produtosModel.color).obs,
            produto: product.produtosModel, 
            image: product.produtosModel.imagem.obs,
            etiqueta: product.produtosModel.nomeEtiqueta?.obs ?? product.produtosModel.descricao.obs
          ),
          CustomText(text: product.produtosModel.descricao, color: Colors.black87, fontSize: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomText(text: "Quantidade: ${product.quantidade.toBrformatted()}", color: Colors.grey),
              CustomText(text: "Total: ${product.total.toCurrency()}", color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}