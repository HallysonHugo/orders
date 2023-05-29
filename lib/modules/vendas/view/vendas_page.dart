import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/produtos/controller/produtos_controller.dart';
import 'package:sport_bar/modules/vendas/controller/venda_controller.dart';
import 'package:sport_bar/widgets/drawer.dart';
import 'package:sport_bar/widgets/products/products_body.dart';

class VendasPage extends StatefulWidget {
  const VendasPage({super.key});

  @override
  State<VendasPage> createState() => _VendasPageState();
}

class _VendasPageState extends State<VendasPage> {

  final _produtosController = Get.put(ProdutosController());
  final _vendasController = Get.put(VendasController());

  @override
  void initState() {
    _produtosController.getProdutos();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomDrawer(),
          Expanded(
            child: ProductsBody(
              products: _produtosController.produtos, 
              listView: false.obs, 
              canDelete: false
            )
          )
        ],
      )
    );
  }
}