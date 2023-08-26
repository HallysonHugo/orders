import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/categorias/controller/category_controller.dart';
import 'package:sport_bar/modules/categorias/model/category_model.dart';
import 'package:sport_bar/widgets/buttons/custom_elevatedbutton.dart';
import 'package:sport_bar/widgets/dialogs/custom_dialog.dart';
import 'package:sport_bar/widgets/scaffold/custom_scaffold.dart';

class AddCategoryPage extends StatefulWidget {
  final CategoryModel? category;
  const AddCategoryPage({super.key, this.category});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  bool get isEditing => widget.category != null;
  final CategoryController _categoryController = Get.put<CategoryController>(CategoryController());
  CategoryModel category = CategoryModel();
  final TextEditingController _descricaoController = TextEditingController();

  @override
  void initState() {
    if(isEditing){
      category = widget.category!;
      _descricaoController.text = category.nome;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(isEditing ? "Alterar Categoria" : "Adicionar Categoria"),
          TextField(
            controller: _descricaoController,
            decoration: const InputDecoration(
              hintText: "Descrição"
            ),
          ),
         const SizedBox(height: 10),
         CustomElevatedButton(text: 'Finalizar', onPressed: ()async{
          try{
            if(_descricaoController.text.isEmpty){
              throw "Descrição não pode ser vazia";
            }
            category.nome = _descricaoController.text;
            if(isEditing){
              await _categoryController.editCategory(category: category);
              await CustomDialog.sucessDialog(text: "Categoria alterada com sucesso");
              Get.back();
              return;
            }
            await _categoryController.createCategory(category: category);
            await CustomDialog.sucessDialog(text: "Categoria criada com sucesso");
          }
          catch(e){
            CustomDialog.erroDialog(text: e.toString());
          }
         })
        ],
      ),
    );
  }
}