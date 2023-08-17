import 'package:get/get.dart';
import 'package:sport_bar/modules/categorias/model/category_model.dart';
import 'package:sport_bar/modules/categorias/repository/category_repository.dart';
import 'package:sport_bar/services/response.dart';

import '../../../services/errors/exeption.dart';

class CategoryController extends GetxController{

  final Rx<CustomResponse<List<CategoryModel>>> categories = CustomResponse<List<CategoryModel>>.none().obs;

  final CategoryRepository _categoryRepository = CategoryRepository();

  Future<void> getCategory({required String search})async{
    try{
      categories.value = CustomResponse.loading();
      categories.value = CustomResponse.completed(data: await _categoryRepository.getCategories(search: search));
    }
    catch(e){
      categories.value = CustomResponse.error(error: CustomException(message: e.toString()));
    }
  }

  Future<void> createCategory({required CategoryModel category})async{
    await _categoryRepository.createCategory(category: category);
    getCategory(search: '');
  }

  Future<void> editCategory({required CategoryModel category})async{
    await _categoryRepository.editCategory(category: category);
    getCategory(search: '');
  }

  Future<void> deleteCategory({required CategoryModel category})async{
    await _categoryRepository.deleteCategory(category: category);
    getCategory(search: '');
  }
}