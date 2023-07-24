import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:sport_bar/modules/produtos/model/produtos_model.dart';
import 'package:sport_bar/services/api/api_provider.dart';
import 'package:sport_bar/services/dio_connect.dart';
import 'package:sport_bar/services/errors/exeption.dart';

class ProdutosRepository{
  final DioConnect _dioConnect = Get.find<DioConnect>();


  //adicionar um produto
  setProduto(ProdutosModel produto) async{
    try{
      Response response = await _dioConnect.dio.post(ApiProvider.produtosApi.produtos, data: produto.toJson());
      return response.data;
    }
    on DioError catch(error){
      throw CustomException.fromDioError(error);
    }
    catch(e){
      throw CustomException(message: e.toString());
    }
  }


  Future<void> updateProdutos({required ProdutosModel produtosModel})async{
    try{
      Response response = await _dioConnect.dio.put(ApiProvider.produtosApi.produtos, data: produtosModel.toJson());
      return response.data;
    }
    on DioError catch(error){
      throw CustomException.fromDioError(error);
    }
    catch(e){
      throw CustomException(message: e.toString());
    }
  }

  //trazer todos os produtos
  Future<List<ProdutosModel>>getProdutos() async{
    try{
      Response response = await _dioConnect.dio.get(ApiProvider.produtosApi.produtos);
      return response.data.map<ProdutosModel>((json) => ProdutosModel.fromJson(json)).toList();
    }
    on DioError catch(error){
      throw CustomException.fromDioError(error);
    }
    catch(e){
      throw CustomException(message: e.toString());
    }
  }

  //trazer um produto pela categoria
  Future<List<ProdutosModel>> getProdutosByCategoria(int id) async{
    try{
      Response response = await _dioConnect.dio.get('${ApiProvider.produtosApi.produtos}/categoria/$id');
      return response.data;
    }
    on DioError catch(error){
      throw CustomException.fromDioError(error);
    }
    catch(e){
      throw CustomException(message: e.toString());
    }
  }

  //trazer um produto pelo nome
  Future<List<ProdutosModel>> searchProducts(String nome) async{
    try{
      Response response = await _dioConnect.dio.get(ApiProvider.produtosApi.search, queryParameters: {
        'search': nome
      });
      return response.data.map<ProdutosModel>((json) => ProdutosModel.fromJson(json)).toList();
    }
    on DioError catch(error){
      throw CustomException.fromDioError(error);
    }
    catch(e){
      throw CustomException(message: e.toString());
    }
  }

  //trazer um produto pelo codigo
  Future<List> getProdutosByCodigo(String codigo) async{
    try{
      Response response = await _dioConnect.dio.get('${ApiProvider.produtosApi.produtos}/codigo/$codigo');
      return response.data;
    }
    on DioError catch(error){
      throw CustomException.fromDioError(error);
    }
    catch(e){
      throw CustomException(message: e.toString());
    }
  }

  deleteProduto(int id) async{
    try{
      Response response = await _dioConnect.dio.delete('${ApiProvider.produtosApi.produtos}/$id');
      return response.data;
    }
    on DioError catch(error){
      throw CustomException.fromDioError(error);
    }
    catch(e){
      throw CustomException(message: e.toString());
    }
  }
}