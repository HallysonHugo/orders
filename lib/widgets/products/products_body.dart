import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sport_bar/modules/produtos/controller/produtos_controller.dart';
import 'package:sport_bar/modules/produtos/model/produtos_model.dart';
import 'package:sport_bar/services/errors/exeption.dart';
import 'package:sport_bar/services/response.dart';
import 'package:sport_bar/utils/color_formatter_utils.dart';
import 'package:sport_bar/utils/decoration_utils.dart';
import 'package:sport_bar/utils/double_formatter.dart';
import 'package:sport_bar/utils/size_util.dart';
import 'package:sport_bar/widgets/buttons/custom_iconbutton.dart';
import 'package:sport_bar/widgets/dialogs/custom_dialog.dart';
import 'package:sport_bar/widgets/products/products_card.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

class ProductsBody extends StatelessWidget {
  final Rx<CustomResponse<List<ProdutosModel>>> products;
  final RxBool listView;
  final bool canDelete;
  final bool isVenda;
  final void Function()? onTap;
  ProductsBody({super.key, required this.products, required this.listView, this.canDelete = false, this.onTap, this.isVenda = false});

  final ScrollController _scrollController = ScrollController();
  final ProdutosController _produtosController = Get.find();

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  _buildBody(BuildContext context){
   return Obx((){
     switch(products.value.status){
      case Status.loading:
        return const CircularProgressIndicator();
      case Status.completed:
        if(products.value.data!.isEmpty){
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('assets/animations/empty_box.json'),
                const CustomText(text: "Nenhum produto encontrado", color: Colors.black87,)
              ],
            )
        );
      }
      return listView.value ? _listView(context) : _gridView();
      case Status.error:
        return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/animations/error.json', height: DeviceSize.getDeviceHeight(context) * 0.4,
                 width: DeviceSize.getDeviceWidth(context)* 0.3),
                CustomText(text: products.value.error!.message, color: Colors.black87,)
              ],
            )
        );
      case Status.none:
        return Container();
      case null:
        return Container();
    }
   });
   
  }

  _loadingBody(){
    return  Center(child: Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 5
        ),
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          color: Colors.red,
        ),
      ),));
  }


  _gridView(){
    return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5
          ),
          itemCount: products.value.data!.length,
          itemBuilder: (context, index){
            return InkWell(
              onTap: onTap,
              child: Container(
                    decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Expanded(
                          child: ImageProductCard(
                            color: ColorFormatterUtils.formatStringToColor(color: products.value.data![index].color).obs,
                            etiqueta: products.value.data![index].nomeEtiqueta == null ? products.value.data![index].descricao.obs :
                            products.value.data![index].nomeEtiqueta!.obs,
                            produto: products.value.data![index],
                            image: products.value.data![index].imagem.obs,
                          ),
                        ),
                        DecorationUtils.DEFAULT_HSEPARATOR,
                        DecorationUtils.DEFAULT_HSEPARATOR,
                        CustomText(text: products.value.data![index].descricao, color: Colors.black87, fontSize: 18,),
                        CustomText(text: products.value.data![index].categoria.id.toString(), color: Colors.black87, fontSize: 18,),
                        CustomText(
                          text: DoubleFormatterUtil.doubleToString(value: products.value.data![index].estoque, isCurrency: false), 
                          color: Colors.black87, 
                          fontSize: 18,),
                        CustomText(
                          text: DoubleFormatterUtil.doubleToString(value:  products.value.data![index].preco), 
                          color: Colors.grey, 
                          fontSize: 18,),
                        if(canDelete)...[
                          CustomIconButton(
                            isLoading: false.obs, 
                            icon: Icons.delete, 
                            color: Colors.red,
                            onTap: ()async{
                              try{
                                await CustomDialog.questionDialog(
                                  text: "Deseja realmente deletar o produto ${products.value.data![index].descricao} ?",
                                  onConfirm: ()async{
                                    try{
                                      await _produtosController.deleteProduto(products.value.data![index].id!);
                                      Get.back();
                                      CustomDialog.sucessDialog(text: "Produto deletado com sucesso").then((value) => Get.back());
                                      _produtosController.getProdutos();
                                    }
                                    catch(e){
                                      throw CustomException(message: e.toString());
                                    }
                                  }
                                );
                              }
                              catch(e){
                                await CustomDialog.erroDialog(text: e.toString());
                              }
                            }
                          ),
                          DecorationUtils.DEFAULT_HSEPARATOR,
                          DecorationUtils.DEFAULT_HSEPARATOR, 
                        ]
                        // ListTile(
                        //   title: CustomText(text: products.value.data![index].descricao, color: Colors.black87, fontSize: 18,),
                        //   subtitle: CustomText(text: DoubleFormatterUtil.doubleToString(value:  products.value.data![index].preco), color: Colors.grey, fontSize: 18,),
                        //   leading: ImageProductCard(
                        //     color: ColorFormatterUtils.formatStringToColor(color: products.value.data![index].color).obs,
                        //     etiqueta: products.value.data![index].nomeEtiqueta == null ? products.value.data![index].descricao.obs :
                        //     products.value.data![index].nomeEtiqueta!.obs,
                        //     produto: products.value.data![index],
                        //     image: products.value.data![index].imagem.obs,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
            );
          }
        );
  }
  _listView(BuildContext context){
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: ListView.builder(
              controller: _scrollController,
              itemCount: products.value.data!.length,
              itemBuilder: (context, index){
                return InkWell(
                  onTap: onTap,
                  child: Container(
                    decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        ImageProductCard(
                          height: 200,
                          width: 200,
                          color: ColorFormatterUtils.formatStringToColor(color: products.value.data![index].color).obs,
                          etiqueta: products.value.data![index].nomeEtiqueta == null ? products.value.data![index].descricao.obs :
                          products.value.data![index].nomeEtiqueta!.obs,
                          produto: products.value.data![index],
                          image: products.value.data![index].imagem.obs,
                        ),
                        DecorationUtils.DEFAULT_HSEPARATOR,
                        DecorationUtils.DEFAULT_HSEPARATOR,
                        Expanded(child: CustomText(text: products.value.data![index].descricao, color: Colors.black87, fontSize: 18,)),
                        Expanded(child: CustomText(text: products.value.data![index].categoria.id.toString(), color: Colors.black87, fontSize: 18,)),
                        Expanded(child: CustomText(
                          text: DoubleFormatterUtil.doubleToString(value: products.value.data![index].estoque, isCurrency: false), 
                          color: Colors.black87, 
                          fontSize: 18,)),
                        Expanded(child: CustomText(
                          text: DoubleFormatterUtil.doubleToString(value:  products.value.data![index].preco), 
                          color: Colors.grey, 
                          fontSize: 18,)),
                        if(canDelete)...[
                          CustomIconButton(
                            isLoading: false.obs, 
                            icon: Icons.delete, 
                            color: Colors.red,
                            onTap: ()async{
                              try{
                                await CustomDialog.questionDialog(
                                  text: "Deseja realmente deletar o produto ${products.value.data![index].descricao} ?",
                                  onConfirm: ()async{
                                    try{
                                      await _produtosController.deleteProduto(products.value.data![index].id!);
                                      Get.back();
                                      CustomDialog.sucessDialog(text: "Produto deletado com sucesso").then((value) => Get.back());
                                      _produtosController.getProdutos();
                                    }
                                    catch(e){
                                      throw CustomException(message: e.toString());
                                    }
                                  }
                                );
                              }
                              catch(e){
                                await CustomDialog.erroDialog(text: e.toString());
                              }
                            }
                          ),
                          DecorationUtils.DEFAULT_HSEPARATOR,
                          DecorationUtils.DEFAULT_HSEPARATOR, 
                        ]
                        // ListTile(
                        //   title: CustomText(text: products.value.data![index].descricao, color: Colors.black87, fontSize: 18,),
                        //   subtitle: CustomText(text: DoubleFormatterUtil.doubleToString(value:  products.value.data![index].preco), color: Colors.grey, fontSize: 18,),
                        //   leading: ImageProductCard(
                        //     color: ColorFormatterUtils.formatStringToColor(color: products.value.data![index].color).obs,
                        //     etiqueta: products.value.data![index].nomeEtiqueta == null ? products.value.data![index].descricao.obs :
                        //     products.value.data![index].nomeEtiqueta!.obs,
                        //     produto: products.value.data![index],
                        //     image: products.value.data![index].imagem.obs,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              }
            ),
      ),
    );
  }
}