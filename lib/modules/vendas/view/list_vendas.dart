import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/vendas/controller/venda_controller.dart';
import 'package:sport_bar/modules/vendas/model/vendas_model.dart';
import 'package:sport_bar/widgets/header/custom_header.dart';
import 'package:sport_bar/widgets/scaffold/custom_scaffold.dart';

class ListVendas extends StatefulWidget {
  const ListVendas({super.key});

  @override
  State<ListVendas> createState() => _ListVendasState();
}

class _ListVendasState extends State<ListVendas> {

  final VendasController _vendasController = Get.put(VendasController());
  final TextEditingController _searchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          CustomHeader(
            searchController: _searchController, 
            onButtonTap: (){}, 
            itemCount: _vendasController.listVendas.value.data?.length ?? 0, 
            title: 'Vendas', 
            buttonTitle: 'Adicionar venda'
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _vendasController.listVendas.value.data?.length ?? 0,
              itemBuilder: (context, index){
                VendasModel vendasModel = _vendasController.listVendas.value.data?[index] ?? VendasModel();
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white
                  ),
                  height: 100,
                  child: Text(vendasModel.toString()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}