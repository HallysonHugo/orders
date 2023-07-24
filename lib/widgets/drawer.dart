import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/categorias/view/category_page.dart';
import 'package:sport_bar/modules/homepage/view/homepage.dart';
import 'package:sport_bar/modules/produtos/view/produtos_page.dart';
import 'package:sport_bar/modules/relatorios/view/relatorios_page.dart';
import 'package:sport_bar/modules/vendas/view/vendas_page.dart';
import 'package:sport_bar/utils/decoration_utils.dart';
import 'package:sport_bar/utils/size_util.dart';
import 'package:sport_bar/widgets/buttons/circled_button.dart';

import '../modules/configuracoes/view/config_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: DeviceSize.getDeviceHeight(context),
            width: DeviceSize.getDeviceWidth(context) * 0.06,
            decoration: 
            const BoxDecoration(
              color: Colors.black87
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:  [
                DecorationUtils.DEFAULT_VSEPARATOR,
                DecorationUtils.DEFAULT_VSEPARATOR,
                CustomCircledButton(icon: Icons.home, text: "Home", onTap: (){
                  Get.offAll(()=> const HomePage(),transition: Transition.noTransition);
                }),
                DecorationUtils.DEFAULT_VSEPARATOR,
                DecorationUtils.DEFAULT_VSEPARATOR,
                CustomCircledButton(icon: Icons.backup_table_rounded, text: "Produtos", onTap: (){
                  Get.offAll(()=> const ProdutosPage(),transition: Transition.noTransition);
                }),
                DecorationUtils.DEFAULT_VSEPARATOR,
                DecorationUtils.DEFAULT_VSEPARATOR,
                CustomCircledButton(icon: Icons.add_shopping_cart, text: "Vendas", onTap: (){
                  Get.offAll(()=> const VendasPage(),transition: Transition.noTransition);
                }),
                DecorationUtils.DEFAULT_VSEPARATOR,
                DecorationUtils.DEFAULT_VSEPARATOR,
                CustomCircledButton(icon: Icons.assignment_rounded, text: "Relatórios", onTap: (){
                  Get.offAll(()=> const RelatoriosPage(),transition: Transition.noTransition);
                }),
                DecorationUtils.DEFAULT_VSEPARATOR,
                DecorationUtils.DEFAULT_VSEPARATOR,
                 CustomCircledButton(icon: Icons.category, text: "Categorias", onTap: (){
                  Get.offAll(()=> const CategoryPage(),transition: Transition.noTransition);
                }),
                DecorationUtils.DEFAULT_VSEPARATOR,
                DecorationUtils.DEFAULT_VSEPARATOR,
                 CustomCircledButton(icon: Icons.payment, text: "Pagamento", onTap: (){
                  Get.offAll(()=> const ConfigPage(),transition: Transition.noTransition);
                }),
                 DecorationUtils.DEFAULT_VSEPARATOR,
                DecorationUtils.DEFAULT_VSEPARATOR,
                CustomCircledButton(icon: Icons.settings, text: "Configuracoes", onTap: (){
                  Get.offAll(()=> const ConfigPage(),transition: Transition.noTransition);
                }),
              ],
            ),
      );
  }
}