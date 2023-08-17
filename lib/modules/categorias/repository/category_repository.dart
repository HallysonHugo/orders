import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:sport_bar/modules/categorias/model/category_model.dart';
import 'package:sport_bar/services/dio_connect.dart';
import 'package:sport_bar/services/errors/exeption.dart';

class CategoryRepository{
  DioConnect dioConnect = getx.Get.find<DioConnect>();
  Dio get _dio => dioConnect.dio;


  Future<List<CategoryModel>> getCategories({required String search})async{
    try{
      Response response = await _dio.get("/categorias",queryParameters: {
        if(search.isNotEmpty) "search": search 
      });
      return response.data.map<CategoryModel>((category) => CategoryModel.fromJson(category)).toList();
    }
    on DioError catch(e){
      throw CustomException.fromDioError(e);
    }
  }


  Future<void> createCategory({required CategoryModel category})async{
    try{
      await _dio.post("/categorias", data: category.toJson());
    }
    on DioError catch(e){
      throw CustomException.fromDioError(e);
    }
  }


  Future<void> editCategory({required CategoryModel category})async{
    try{
      await _dio.put("/categorias/${category.id}", data: category.toJson());
    }
    on DioError catch(e){
      throw CustomException.fromDioError(e);
    }
  }
  Future<void> deleteCategory({required CategoryModel category})async{
    try{
      await _dio.delete("/categorias/${category.id}");
    }
    on DioError catch(e){
      throw CustomException.fromDioError(e);
    }
  }
}