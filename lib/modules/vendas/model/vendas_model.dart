import 'package:sport_bar/modules/produtos/model/produtos_model.dart';
import 'package:sport_bar/modules/vendas/model/cart_model.dart';

class VendasModel{
  int? codigo;
  DateTime data = DateTime.now();
  DateTime hora = DateTime.now();
  String cliente = "";
  String vendedor = "";
  CartModel carrinho = CartModel();

  VendasModel();

  VendasModel.fromJson(Map<String, dynamic> json){
    codigo = json['codigo'];
    data = DateTime.parse(json['data']);
    hora = DateTime.parse(json['hora']);
    cliente = json['cliente'];
    vendedor = json['vendedor'];
    // carrinho.produtos = json['produtos'].map<ProdutosModel>((e) => ProdutosModel.fromJson(e)).toList();
  }

  toJson(){
    return {
      'data': data.toString(),
      'hora': hora.toString(),
      'cliente': cliente,
      'vendedor': vendedor,
      'descontoTotal': carrinho.desconto,
      'valorTotal': carrinho.total,
      'produtos': carrinho.produtos.map((e) => e.toJson())  .toList(),
    };
  }
}