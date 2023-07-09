import 'package:sport_bar/modules/vendas/model/cart_model.dart';
import 'package:sport_bar/modules/vendas/model/ficha_model.dart';
import 'package:sport_bar/modules/vendas/model/forma_pagamento_venda_model.dart';

class VendasModel{
  int? codigo;
  DateTime data = DateTime.now();
  DateTime hora = DateTime.now();
  String cliente = "";
  String vendedor = "";
  CartModel carrinho = CartModel();
  List<FichaModel> fichas = [];
  List<FormaPagamentoVendaModel> formasPagamento = [];
  double valorPago = 0.0;

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
      'produtos': carrinho.produtos.map((e) => e.toJson()).toList(),
    };
  }
}