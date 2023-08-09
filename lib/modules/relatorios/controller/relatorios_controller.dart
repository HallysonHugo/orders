import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/relatorios/model/relatorios_model.dart';
import 'package:sport_bar/modules/vendas/controller/venda_controller.dart';
import 'package:sport_bar/modules/vendas/model/vendas_model.dart';
import 'package:sport_bar/services/errors/exeption.dart';

class RelatoriosController extends GetxController{

  Future<RelatoriosModel<VendasModel>> relatorioVendasPeriodo({required BuildContext context})async{
    try{
      final RelatoriosModel<VendasModel> relatoriosModel = RelatoriosModel<VendasModel>();
      relatoriosModel.dataInicial = await showDatePicker(
        context: context, 
        initialDate: DateTime.now(), 
        firstDate: DateTime.utc(2020), 
        lastDate: DateTime.utc(DateTime.now().year + 1)
      );
      if(relatoriosModel.dataInicial != null){
        // ignore: use_build_context_synchronously
        relatoriosModel.dataFinal = await showDatePicker(
          context: context, 
          initialDate: DateTime.now(), 
          firstDate: relatoriosModel.dataInicial!, 
          lastDate: DateTime.utc(DateTime.now().year + 1));
      }
      final VendasController vendasController = Get.put(VendasController());
      relatoriosModel.dados = await vendasController.getVendas(dataInicial: relatoriosModel.dataInicial, dataFinal: relatoriosModel.dataFinal);
      if(relatoriosModel.dados.isEmpty){
        throw CustomException(message: 'Nenhuma venda para o periodo informado');
      }
      return relatoriosModel;
    }
    on CustomException{
      rethrow;
    }
  }
}