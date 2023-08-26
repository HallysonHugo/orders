import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/produtos/controller/produtos_controller.dart';
import 'package:sport_bar/modules/produtos/view/adicionar_produto_page.dart';
import 'package:sport_bar/utils/decoration_utils.dart';
import 'package:sport_bar/utils/size_util.dart';
import 'package:sport_bar/widgets/buttons/custom_elevatedbutton.dart';
import 'package:sport_bar/widgets/buttons/custom_iconbutton.dart';
import 'package:sport_bar/widgets/products/products_body.dart';
import 'package:sport_bar/widgets/scaffold/custom_scaffold.dart';
import 'package:sport_bar/widgets/search_widget.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

class ProdutosPage extends StatefulWidget {
 const ProdutosPage({super.key});

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {

  @override
  void initState() {
    produtosController.getProdutos();
    super.initState();
  }

  final ProdutosController produtosController = Get.put(ProdutosController());
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SizedBox(
        height: DeviceSize.getDeviceHeight(context),
        width: DeviceSize.getDeviceWidth(context) * 0.94,
        child: Column(
          children: [
            DecorationUtils.DEFAULT_VSEPARATOR,
            DecorationUtils.DEFAULT_VSEPARATOR,
            Row(
              children: [
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,

                //Titulo
                const CustomText(
                  text: 'Produtos',
                  fontSize: 30,
                  color: Colors.black87,
                ),

                //Quantidade de produtos e validação para caso não tenha nenhum produto cadastrado
                Obx(
                   (){
                      return CustomText(text: "  ${produtosController.produtos.value.data?.length ?? 0} itens cadastrados", 
                        fontSize: 18, 
                        color: Colors.grey);
                    }

                ),
              ],
            ),

            DecorationUtils.DEFAULT_VSEPARATOR,
            DecorationUtils.DEFAULT_VSEPARATOR,
            Row(
              children:  [
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,

                //Barra de pesquisa
                CustomTextField(
                  width: 500,
                  controller: _searchController,
                  hintText: "Item, valor ou codigo",
                  onChanged: (text){
                    produtosController.getProdutos(search: text);
                  },
                  suffixIcon: const Icon(Icons.search),
                ),

                
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,

                //Botao que abre o modal de filtros
                Expanded(
                  child: CustomIconButton(
                    isLoading: false.obs,
                    icon:Icons.filter_alt_outlined, 
                    color: Colors.greenAccent[200],
                    text: "Filtros",
                    onTap: (){
                      
                    },
                  ),
                ),
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,

                //TODO: verificar responsividadade

                //Botao que abre o modal de categorias
                Expanded(
                  child: CustomIconButton(
                    isLoading: false.obs,
                    text: "Categorias",
                    icon: Icons.sell,
                    color: Colors.greenAccent[200],
                    onTap: (){},
                  ),
                ),
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                CustomElevatedButton(
                  text: "Adicionar produto",
                  onPressed: (){
                    Get.to(()=>const AdicionarProduto())?.then((value) => produtosController.getProdutos());
                  },
                ),
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
              ],
            ),
            const SizedBox(height: 10,),
           const Row(
              children: [
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              SizedBox(
                width: 150,
                child: CustomText(text: "Produto", fontSize: 18, color: Colors.grey)),
              Expanded(child: CustomText(text: "Descrição", fontSize: 18, color: Colors.grey)),
              Expanded(child: CustomText(text: "Categoria", fontSize: 18, color: Colors.grey)),
              Expanded(child: CustomText(text: "Estoque", fontSize: 18, color: Colors.grey)),
              Expanded(child: CustomText(text: "Valor", fontSize: 18, color: Colors.grey)),
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              DecorationUtils.DEFAULT_HSEPARATOR,
              ],
            ),
            
            ProductsBody(
              products: produtosController.produtos, 
              listView: true.obs, 
              canDelete: true,
              onTap: (produto){
                Get.to(()=>AdicionarProduto(productModel: produto))?.then((value) => produtosController.getProdutos());
              },
              ),
          ],
        ),
      )
    );
  }
}