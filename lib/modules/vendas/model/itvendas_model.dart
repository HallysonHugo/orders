import 'package:sport_bar/modules/produtos/model/produtos_model.dart';

class ItVendas{
  ProdutosModel produtosModel = ProdutosModel();
  double quantidade = 0.0;
  double desconto = 0.0;
  double get precoVenda => produtosModel.precoVenda;
  
  double get total => (precoVenda - desconto) * quantidade;

  ItVendas();
  ItVendas.fromJson(Map<String, dynamic> json){
    produtosModel.id = json['id'];
    quantidade = json['quantidade'];
    desconto = json['desconto'];
  }

    toJson(){
    return {
      'id': produtosModel.id,
      'quantidade': quantidade,
      'desconto': desconto,
      "precoVenda": precoVenda,
      'total': total,
    };
  }
}