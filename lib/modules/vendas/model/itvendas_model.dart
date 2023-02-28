import 'package:sport_bar/modules/produtos/model/produtos_model.dart';

class ItVendas{
  ProdutosModel produtosModel = ProdutosModel();
  double quantidade = 0.0;
  double desconto = 0.0;
  double _precoVenda = 0.0;
  set precoVenda(double? preco){
    if(preco != null){
      _precoVenda = preco;
    }
    else{
      _precoVenda = produtosModel.precoVenda;
    }
  }
  double get total => (_precoVenda - desconto) * quantidade;


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
      "precoVenda": _precoVenda,
      'total': total,
    };
  }
}