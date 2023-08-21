import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/utils/decoration_utils.dart';
import 'package:sport_bar/widgets/buttons/custom_elevatedbutton.dart';
import 'package:sport_bar/widgets/buttons/custom_iconbutton.dart';
import 'package:sport_bar/widgets/search_widget.dart';
import 'package:sport_bar/widgets/text/custom_text.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final void Function()? onButtonTap;
  final TextEditingController searchController;
  final int itemCount;
  final bool canFilter;
  final bool category;
  final bool showButton;
  final EdgeInsetsGeometry? searchMargin;
  final EdgeInsetsGeometry? filterMargin;
  final EdgeInsetsGeometry? categoryMargin;
  final Function(String)? searchOnChanged;
  
  const CustomHeader({super.key, required this.searchController, this.searchOnChanged, required this.onButtonTap, this.searchMargin, this.filterMargin, this.categoryMargin,
    required this.itemCount, required this.title, this.canFilter = false, this.category = false, required this.buttonTitle, this.showButton = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecorationUtils.DEFAULT_VSEPARATOR,
            DecorationUtils.DEFAULT_VSEPARATOR,
            Row(
              children: [
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,
                DecorationUtils.DEFAULT_HSEPARATOR,

                //Titulo
                CustomText(
                  text: title,
                  fontSize: 30,
                  color: Colors.black87,
                ),
                const SizedBox(width: 10),
                //Quantidade de produtos e validação para caso não tenha nenhum produto cadastrado
                CustomText(text: "$itemCount ${itemCount == 1 ? "item cadastrado" : "itens cadastrados"}", 
                  fontSize: 18, 
                  color: Colors.grey
                )
              ],
            ),
            DecorationUtils.DEFAULT_VSEPARATOR,
            DecorationUtils.DEFAULT_VSEPARATOR,
            Row(
              children:  [
                //Barra de pesquisa
                Expanded(
                  child: CustomTextField(
                    margin: searchMargin,
                    controller: searchController,
                    hintText: "Item, valor ou codigo",
                    onChanged: searchOnChanged,
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
                //Botao que abre o modal de filtros
                if(canFilter)...[
                  Expanded(
                    child: Container(
                      margin: filterMargin,
                      child: CustomIconButton(
                        isLoading: false.obs,
                        icon:Icons.filter_alt_outlined, 
                        color: Colors.greenAccent[200],
                        text: "Filtros",
                        onTap: (){
                          
                        },
                      ),
                    ),
                  ),
                ],
                if(category)...[
                  Expanded(
                    child: Container(
                      margin: categoryMargin,
                      child: CustomIconButton(
                        isLoading: false.obs,
                        text: "Categorias",
                        icon: Icons.sell,
                        color: Colors.greenAccent[200],
                        onTap: (){},
                      ),
                    ),
                  ),
                ],
                //Botao que abre o modal de categorias
                if(showButton)...[
                  CustomElevatedButton(
                    text: buttonTitle,
                    onPressed: onButtonTap,
                  ),
                  DecorationUtils.DEFAULT_HSEPARATOR,
                  DecorationUtils.DEFAULT_HSEPARATOR,
                ]
              ],
            ),
      ],
    );
  }
}