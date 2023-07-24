import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/categorias/controller/category_controller.dart';
import 'package:sport_bar/modules/categorias/model/category_model.dart';
import 'package:sport_bar/widgets/buttons/custom_elevatedbutton.dart';
import 'package:sport_bar/widgets/scaffold/custom_scaffold.dart';
import 'package:sport_bar/widgets/search_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final TextEditingController _searchController = TextEditingController();
  final CategoryController _categoryControlelr = Get.put<CategoryController>(CategoryController());
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            hintText: "Pesquisar Categoria",
            controller: _searchController,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Obx(() {
                return ListView.builder(
                  itemCount: _categoryControlelr.categories.value.data?.length ?? 0,
                  itemBuilder: (context, index){
                    CategoryModel category = _categoryControlelr.categories.value.data?[index] ?? CategoryModel();
                    return ListTile(
                      title: Text("Categoria ${category.descricao}}"),
                      onTap: (){
                        
                      },
                      trailing: IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.delete),
                      ),
                    );
                  }
                );
              }
            ),
          ),
          CustomElevatedButton(
            text: "Adicionar Categoria",
            onPressed: (){},
          ),
        ],
      )
    );
  }
}