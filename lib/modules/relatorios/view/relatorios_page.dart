import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/relatorios/controller/relatorios_controller.dart';
import 'package:sport_bar/modules/relatorios/model/relatorios_model.dart';
import 'package:sport_bar/modules/relatorios/view/relatorio_vendas_periodo.dart';
import 'package:sport_bar/modules/vendas/model/vendas_model.dart';
import 'package:sport_bar/services/errors/exeption.dart';
import 'package:sport_bar/widgets/buttons/custom_elevatedbutton.dart';
import 'package:sport_bar/widgets/dialogs/custom_dialog.dart';
import 'package:sport_bar/widgets/scaffold/custom_scaffold.dart';


class RelatoriosPage extends StatelessWidget {
  const RelatoriosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomElevatedButton(
            text: 'Relatório de vendas por período', 
            onPressed: ()async{
              try{
                final RelatoriosController relatoriosController = Get.put(RelatoriosController());
                final RelatoriosModel<VendasModel> relatoriosModel = await relatoriosController.relatorioVendasPeriodo(
                  context: context
                );
                Get.to(()=> RelatorioVendasPeriodo(relatoriosModel: relatoriosModel));
              }
              on CustomException catch(e){
                CustomDialog.erroDialog(text: e.toString());
              }
              catch(e){
                CustomDialog.erroDialog(text: "Erro desconhecido, contate o adminstrador. Erro: $e");
              }
            }
          ),
        ],
      ),
    );
  }
}