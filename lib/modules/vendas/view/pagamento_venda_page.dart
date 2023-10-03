import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/forma_pagamento/controller/pagamento_controller.dart';
import 'package:sport_bar/modules/forma_pagamento/model/forma_pagamento_model.dart';
import 'package:sport_bar/modules/vendas/model/forma_pagamento_venda_model.dart';
import 'package:sport_bar/modules/vendas/model/vendas_model.dart';
import 'package:sport_bar/utils/extensions.dart';

class PagamentoVenda extends StatefulWidget {
  final VendasModel venda;
  const PagamentoVenda({super.key, required this.venda});

  @override
  State<PagamentoVenda> createState() => _PagamentoVendaState();
}

class _PagamentoVendaState extends State<PagamentoVenda> {

  final PagamentoController _pagamentoController = Get.put(PagamentoController());
  FormaPagamentoVendaModel formaPagamentoVendaModel = FormaPagamentoVendaModel();
  @override
  void initState() {
    _pagamentoController.getFormaPagamento();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Obx(
            () {
              if(_pagamentoController.formasPagamento.value.isLoading){
                return const Center(child: CircularProgressIndicator());
              }
              if(_pagamentoController.formasPagamento.value.hasError){
                return Center(child: Text(_pagamentoController.formasPagamento.value.error!.message));
              }
              return ListView(
                children: [
                  for(final FormaPagamentoModel formaPagamento in _pagamentoController.formasPagamento.value.data ?? [])
                    ListTile(
                      title: Text(formaPagamento.descricao),
                      onTap: (){
                        formaPagamentoVendaModel.formaPagamentoModel = formaPagamento;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Valor pago',
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (text){
                              formaPagamentoVendaModel.valorPago = double.tryParse(text) ?? 0;
                            },
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            widget.venda.formasPagamento.add(formaPagamentoVendaModel);
                            Navigator.pop(context);
                          }, 
                          icon: const Icon(Icons.add)
                        )
                      ],
                  )
                ],
              );
            }
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Text('Total: ${widget.venda.carrinho.total.toCurrency()}'),
            ),
            Expanded(
              child: Text('Pago: ${widget.venda.valorPago.toCurrency()}'),
            ),
            Expanded(
              child: Text('Troco: ${widget.venda.troco.toCurrency()}'),
            ),
          ],
        )
      ],
    );
  }
}