import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/categorias/controller/category_controller.dart';
import 'package:sport_bar/modules/categorias/model/category_model.dart';
import 'package:sport_bar/modules/categorias/view/add_category_page.dart';
import 'package:sport_bar/widgets/buttons/custom_elevatedbutton.dart';
import 'package:sport_bar/widgets/header/custom_header.dart';
import 'package:sport_bar/widgets/popupmenu/custom_popupmenu.dart';
import 'package:sport_bar/widgets/scaffold/custom_scaffold.dart';

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
        children: [
          SizedBox(
            height: 400,
            child: CustomHeader(
              searchController: _searchController, 
              searchMargin: const EdgeInsets.symmetric(horizontal: 10),
              onButtonTap: (){}, 
              itemCount: _categoryControlelr.categories.value.data?.length ?? 0,
              title: 'Categorias', 
              buttonTitle: 'Adicionar Categoria'),
          ),
          Expanded(
            child: Obx(() {
                return ListView.builder(
                  itemCount: _categoryControlelr.categories.value.data?.length ?? 0,
                  itemBuilder: (context, index){
                    CategoryModel category = _categoryControlelr.categories.value.data?[index] ?? CategoryModel();
                    return ListTile(
                      title: Text("${category.id} - ${category.descricao}}"),
                      trailing: CustomPopupMenuButtom(
                        onChange: (){
                          _categoryControlelr.editCategory(category: category);
                        },
                        onDelete: (){
                          _categoryControlelr.deleteCategory(category: category);
                        },
                      ),
                    );
                  }
                );
              }
            ),
          ),
          CustomElevatedButton(
            text: "Adicionar Categoria",
            onPressed: (){
              Get.to(()=> const AddCategoryPage());
            },
          ),
        ],
      )
    );
  }
}