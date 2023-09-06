import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/forma_pagamento/controller/pagamento_controller.dart';
import 'package:sport_bar/widgets/header/custom_header.dart';
import 'package:sport_bar/widgets/scaffold/custom_scaffold.dart';

class PagamentoPage extends StatefulWidget {
  const PagamentoPage({super.key});

  @override
  State<PagamentoPage> createState() => _PagamentoPageState();
}

class _PagamentoPageState extends State<PagamentoPage> {
  final PagamentoController _pagamentoController = Get.put(PagamentoController());
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          CustomHeader(
            searchController: _searchController, 
            onButtonTap: (){}, 
            itemCount: _pagamentoController.formasPagamento.value.data?.length ?? 0,
            title: 'Formas de pagamento', 
            buttonTitle: 'Adicionar forma de pagamento'
          ),
        ],
      ),
    );
  }
}