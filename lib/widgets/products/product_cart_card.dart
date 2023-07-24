import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/vendas/model/itvendas_model.dart';
import 'package:sport_bar/utils/color_formatter_utils.dart';
import 'package:sport_bar/utils/extensions.dart';
import 'package:sport_bar/widgets/products/products_card.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

class ProductCartCard extends StatelessWidget {
  final ItVendas product;
  final double? height;
  final double? width;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const ProductCartCard({super.key, required this.product, this.height, this.width, this.onAdd, this.onRemove});
  

  

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: onRemove, 
                icon: const Icon(Icons.remove, color: Colors.red,)),
              IconButton(
                onPressed: onAdd, 
                icon: const Icon(Icons.add, color: Colors.green,))
            ],
          )
        ],
      ),
    );
  }
}