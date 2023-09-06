import 'package:sport_bar/modules/vendas/model/cart_model.dart';
import 'package:sport_bar/modules/vendas/model/ficha_model.dart';
import 'package:sport_bar/modules/vendas/model/forma_pagamento_venda_model.dart';

class VendasModel{
  int? codigo;
  DateTime data = DateTime.now();
  String cliente = "";
  String vendedor = "";
  CartModel carrinho = CartModel();
  List<FichaModel> fichas = [];
  List<FormaPagamentoVendaModel> formasPagamento = [];

  VendasModel();

  VendasModel.fromJson(Map<String, dynamic> json){
    codigo = json['codigo'];
    data = DateTime.parse(json['data']);
    cliente = json['cliente'];
    vendedor = json['vendedor'];
  }

  toJson(){
    return {
      'idCliente': 1,
      'idFuncionario': 1,
      'formaPagamento': formasPagamento.map((e) => e.toJson()).toList(),
      'descontoTotal': carrinho.desconto,
      'valorTotal': carrinho.total,
    };
  }
}