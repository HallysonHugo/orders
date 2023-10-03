import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/produtos/controller/produtos_controller.dart';
import 'package:sport_bar/modules/produtos/model/produtos_model.dart';
import 'package:sport_bar/modules/vendas/controller/venda_controller.dart';
import 'package:sport_bar/modules/vendas/model/itvendas_model.dart';
import 'package:sport_bar/modules/vendas/model/vendas_model.dart';
import 'package:sport_bar/modules/vendas/view/pagamento_venda_page.dart';
import 'package:sport_bar/services/errors/exeption.dart';
import 'package:sport_bar/utils/extensions.dart';
import 'package:sport_bar/utils/size_util.dart';
import 'package:sport_bar/widgets/body/products_body_new.dart';
import 'package:sport_bar/widgets/buttons/custom_elevatedbutton.dart';
import 'package:sport_bar/widgets/dialogs/custom_dialog.dart';
import 'package:sport_bar/widgets/header/custom_header.dart';
import 'package:sport_bar/widgets/products/product_cart_card.dart';
import 'package:sport_bar/widgets/products/grid_product_card.dart';
import 'package:sport_bar/widgets/scaffold/custom_scaffold.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

class VendasPage extends StatefulWidget {
  const VendasPage({super.key});

  @override
  State<VendasPage> createState() => _VendasPageState();
}

class _VendasPageState extends State<VendasPage> {

  final _produtosController = Get.put(ProdutosController());
  final _vendasController = Get.put(VendasController());
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  VendasModel vendasModel = VendasModel();


  @override
  void initState() {
    _produtosController.getProdutos();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          CustomHeader(
            searchMargin: const EdgeInsets.symmetric(horizontal: 10),
            searchController: _searchController, 
            searchOnChanged: (text){
              _produtosController.getProdutos(search: text);
            },
            onButtonTap: (){}, 
            showButton: false,
            canFilter: true,
            category: true,
            itemCount: _produtosController.produtos.value.data?.length ?? 0, 
            title: 'Produtos para venda', 
            buttonTitle: ''
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Obx((){
                      return CustomBody(
                        customResponse: _produtosController.produtos.value,
                        isGridView: true,
                        body: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1.5
                          ),
                          itemCount: _produtosController.produtos.value.data?.length ?? 0,
                          itemBuilder: (context, index){
                            final produto = _produtosController.produtos.value.data?[index] ?? ProdutosModel();
                            return GridProductCard(
                              product: produto,
                              onTap: (){
                                ItVendas itVendas = ItVendas();
                                itVendas.quantidade = 1;
                                itVendas.produtosModel = produto;
                                _vendasController.addItensVenda(itVendas: itVendas);
                              },
                            );
                          }
                        ),
                      );
                    }
                  )
                ),
          
                 Container(
                    color: Colors.white,
                    width: DeviceSize.getDeviceWidth(context) * 0.3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Obx(
                            () {
                              return ListView.separated(
                                separatorBuilder: (context, index) => const Divider(color: Colors.grey),
                                itemCount: _vendasController.itensVenda.length,
                                controller: _scrollController,
                                itemBuilder: ((context, index) {
                                  ItVendas itVendas = _vendasController.itensVenda[index];
                                  return ProductCartCard(
                                    onAdd: (){
                                      _vendasController.addItensVenda(itVendas: itVendas);
                                    },
                                    onRemove: (){
                                      _vendasController.removeItemVenda(itVendas: itVendas);
                                    },
                                    product: _vendasController.itensVenda[index],
                                  );
                                }),
                              );
                            }
                          ),
                        ),
                        Obx(
                          () {
                            return CustomText(text: "Total: ${_vendasController.itensVenda.fold(0.0, (previousValue, element) => previousValue + element.total).toCurrency()}", 
                            color: Colors.black87, fontSize: 18,
                            );
                          }
                        ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomElevatedButton(
                        text: 'Finalizar',
                        onPressed: ()async{
                          try{
                            if(_vendasController.itensVenda.isEmpty){
                              throw CustomException(message: "Não é possivel fechar a venda sem produtos");
                            }
                            vendasModel.carrinho.produtos = _vendasController.itensVenda; 
                            await Get.to(() =>  PagamentoVenda(venda: vendasModel));
                            await _vendasController.setVenda(vendasModel: vendasModel);
                            await CustomDialog.sucessDialog(text: "Venda finalizada com sucesso");
                          }
                          catch(e){
                            CustomDialog.erroDialog(text: e.toString());
                          }
                        }),
                    )
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ],
      )
    );
  }
}