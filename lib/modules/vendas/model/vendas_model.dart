import 'package:sport_bar/modules/produtos/model/produtos_model.dart';
import 'package:sport_bar/modules/vendas/model/cart_model.dart';
import 'package:sport_bar/modules/vendas/model/itvendas_model.dart';

class VendasModel{
  late int codigo;
  DateTime data = DateTime.now();
  DateTime hora = DateTime.now();
  String cliente = "";
  String vendedor = "";
  CartModel carrinho = CartModel();

  VendasModel.fromJson(Map<String, dynamic> json){
    codigo = json['codigo'];
    data = DateTime.parse(json['data']);
    hora = DateTime.parse(json['hora']);
    cliente = json['cliente'];
    vendedor = json['vendedor'];
    carrinho.produtos = json['produtos'].map<ProdutosModel>((e) => ProdutosModel.fromJson(e)).toList();
  }

  toJson(){
    return {
      'codigo': codigo,
      'data': data.toString(),
      'hora': hora.toString(),
      'cliente': cliente,
      'vendedor': vendedor,
      'produtos': carrinho.produtos.map((e) => e.toJson()).toList(),
    };
  }
}