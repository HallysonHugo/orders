import 'package:sport_bar/modules/forma_pagamento/model/forma_pagamento_model.dart';

class FormaPagamentoVendaModel{
  int? id;
  int? idVenda;
  FormaPagamentoModel formaPagamentoModel = FormaPagamentoModel();
  double valorPago = 0;
  
  FormaPagamentoVendaModel();


  toJson(){
    return {
      'idFormaPagamento': formaPagamentoModel.id,
      'valorPago': valorPago
    };
  }
}