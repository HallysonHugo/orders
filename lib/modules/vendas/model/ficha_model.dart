import 'package:sport_bar/modules/vendas/model/itvendas_model.dart';

class FichaModel{
  int? id;
  String? codigoFicha;
  bool retirado = false;
  ItVendas itemVenda = ItVendas();

  FichaModel();

  FichaModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    codigoFicha = json['codigoFicha'];
    retirado = json['retirado'];
    itemVenda.id = json['idItemVenda'];
    itemVenda.produtosModel.id = json['idProduto'];
  }
}