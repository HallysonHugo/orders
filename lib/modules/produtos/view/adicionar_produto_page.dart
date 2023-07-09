import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/produtos/controller/produtos_controller.dart';
import 'package:sport_bar/modules/produtos/model/produtos_model.dart';
import 'package:sport_bar/utils/color_formatter_utils.dart';
import 'package:sport_bar/utils/decoration_utils.dart';
import 'package:sport_bar/utils/size_util.dart';
import 'package:sport_bar/widgets/buttons/custom_elevatedbutton.dart';
import 'package:sport_bar/widgets/buttons/custom_iconbutton.dart';
import 'package:sport_bar/widgets/dialogs/color_picker_dialog.dart';
import 'package:sport_bar/widgets/dialogs/custom_dialog.dart';
import 'package:sport_bar/widgets/drawer.dart';
import 'package:sport_bar/widgets/products/products_card.dart';
import 'package:sport_bar/widgets/search_widget.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

class AdicionarProduto extends StatefulWidget {
  static const String routeName = '/adicionar-produto';
  final ProdutosModel? productModel;
  const AdicionarProduto({super.key, this.productModel});

  @override
  State<AdicionarProduto> createState() => _AdicionarProdutoState();
}

class _AdicionarProdutoState extends State<AdicionarProduto> {
  ProdutosModel produtosModel = ProdutosModel();

  final ScrollController _scrollController = ScrollController();

  final TextEditingController _descricaoProdutoController = TextEditingController();

  final TextEditingController _precoProdutoController = TextEditingController();

  final TextEditingController _etiquetaProdutoController = TextEditingController();

  final TextEditingController _estoqueProdutoController = TextEditingController();

  final TextEditingController _estoqueMinimoController = TextEditingController();

  final ProdutosController produtosController = Get.find<ProdutosController>();

  final RxString _imagePath = ''.obs;

  final RxString _preco = ''.obs;

  final RxString _descricao = ''.obs;

  final RxString _etiqueta = ''.obs;

  RxBool isLoading = false.obs;

  final Rx<Color> _color = Colors.grey[200]!.obs;

  @override
  void initState() {
    if(widget.productModel != null){
      produtosModel = widget.productModel!;
      _descricaoProdutoController.text = produtosModel.descricao;
      _precoProdutoController.text = produtosModel.preco.toString();
      _etiquetaProdutoController.text = produtosModel.nomeEtiqueta ?? "";
      _estoqueProdutoController.text = produtosModel.estoque.toString();
      _estoqueMinimoController.text = produtosModel.estoqueMinimo?.toString() ?? "";
      _imagePath.value = produtosModel.imagem ;
      _preco.value = produtosModel.preco.toString();
      _descricao.value = produtosModel.descricao ?? "";
      _etiqueta.value = produtosModel.nomeEtiqueta ?? "";
      _color.value = ColorFormatterUtils.formatStringToColor(color: produtosModel.color);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const CustomDrawer(),
          DecorationUtils.DEFAULT_HSEPARATOR,
          DecorationUtils.DEFAULT_HSEPARATOR,
          DecorationUtils.DEFAULT_HSEPARATOR,
          Container(
            height: DeviceSize.getDeviceHeight(context),
            width: DeviceSize.getDeviceWidth(context) * 0.92,
            child: Column(
              children: [
                DecorationUtils.DEFAULT_VSEPARATOR,
                DecorationUtils.DEFAULT_VSEPARATOR,
                Row(
                  children:  [
                    IconButton(
                    onPressed: (){
                      Get.back();
                    }, 
                    icon: const Icon(Icons.arrow_back)),
                    const CustomText(
                      text: 'Cadastrar Produtos', 
                      fontSize: 30,
                      color: Colors.black87,
                    ),
                  ],
                ),
                Scrollbar(
                  controller: _scrollController,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        DecorationUtils.DEFAULT_VSEPARATOR,
                        DecorationUtils.DEFAULT_VSEPARATOR,
                        Card(
                          elevation: 0,
                          child: SizedBox(
                            width: DeviceSize.getDeviceWidth(context) * 0.5,
                            child: Column(
                              children: [
                              ImageProductCard(
                                width: 300,
                                height: 300,
                                produto: produtosModel, 
                                image: _imagePath, 
                                color: _color,
                                etiqueta: _etiqueta),
                                Obx(() {
                                    return CustomText(text: "Descrição: ${_descricao.value}", color: Colors.black87,fontSize: 16,);
                                  }
                                ),
                                Obx(() {
                                    return CustomText(text: "Preço: ${_preco.value}", color: Colors.black87,fontSize: 16,);
                                  }
                                ),
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    child: CustomIconButton(
                                      isLoading: isLoading,
                                      text: "Fotos",
                                      icon: Icons.photo,
                                      color: Colors.greenAccent[400],
                                      onTap: ()async{
                                        try{
                                          isLoading.value = true;
                                          PlatformFile image = await produtosController.pickProductImage();
                                          _imagePath.value = image.path ?? ""; 
                                        }
                                        catch(e){
                                          produtosModel.imagem = "";
                                          print(e);
                                        }
                                        finally{
                                          isLoading.value = false;
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    child: CustomIconButton(
                                      isLoading: false.obs,
                                      text: "Cor",
                                      icon: Icons.format_paint_rounded,
                                      color: Colors.greenAccent[400],
                                      onTap: ()async{
                                        try{
                                        _color.value = await ColorPickerDialog.colorPickerDialog();
                                        }
                                        catch(e){
                                          print(e.toString());
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              DecorationUtils.DEFAULT_VSEPARATOR,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomTextField(
                                    label: "Nome do produto",
                                    controller: _descricaoProdutoController,
                                    onChanged: (value){
                                      _descricao.value = value;
                                    },
                                  ),
                                ],
                              ),
                              DecorationUtils.DEFAULT_VSEPARATOR,
                              DecorationUtils.DEFAULT_VSEPARATOR,
                               Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomTextField(
                                    width: 150,
                                    label: "Estoque",
                                    controller: _estoqueProdutoController,
                                  ),
                                  DecorationUtils.DEFAULT_HSEPARATOR,
                                  CustomTextField(
                                    width: 150,
                                    label: "Estoque Minimo",
                                    controller: _estoqueMinimoController,
                                  ),
                                ],
                              ),
                              DecorationUtils.DEFAULT_VSEPARATOR,
                              DecorationUtils.DEFAULT_VSEPARATOR,

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomTextField(
                                    label: "Nome da etiqueta",
                                    controller: _etiquetaProdutoController,
                                    onChanged: (value){
                                      _etiqueta.value = value;
                                    },  
                                  ),
                                ],
                              ),
                              DecorationUtils.DEFAULT_VSEPARATOR,
                              DecorationUtils.DEFAULT_VSEPARATOR,

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomTextField(
                                    label: "Preço do produto",
                                    controller: _precoProdutoController,
                                    isCurrency: true,
                                    onChanged: (value){
                                      _preco.value = value;
                                    },
                                  ),
                                ],
                              ),
                              DecorationUtils.DEFAULT_VSEPARATOR,
                              DecorationUtils.DEFAULT_VSEPARATOR,

                              
                              ],
                            ),

                          ),
                        ),
                        CustomElevatedButton(
                          onPressed: ()async{
                            try{
                              produtosModel = produtosController.setProduto(
                                descricao: _descricaoProdutoController.text, 
                                nomeEtiqueta: _etiquetaProdutoController.text, 
                                preco: _precoProdutoController.text, 
                                categoria: 1, 
                                imagem: _imagePath.value,
                                color: _color.value,
                                estoque : _estoqueProdutoController.text,
                                estoqueMinimo: _estoqueMinimoController.text
                                );
                              if(widget.productModel != null){
                                produtosModel.id = widget.productModel!.id;
                                await produtosController.updateProdutoApi(produto: produtosModel);
                                CustomDialog.sucessDialog(text: "Produto atualizado com sucesso!").then((value) => Get.back());
                                return;
                              }
                              await produtosController.setProdutoApi(produto: produtosModel);
                              CustomDialog.sucessDialog(text: "Produto cadastrado com sucesso!").then((value) => Get.back());
                            }
                            catch(e){
                              CustomDialog.erroDialog(text: e.toString());
                            }
                          },
                          text: "Finalizar")
                      ],
                    )
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}