import 'package:dio/dio.dart';
import 'package:get/get.dart'as getx;
import 'package:sport_bar/modules/vendas/model/vendas_model.dart';
import 'package:sport_bar/services/errors/exeption.dart';

import '../../../services/dio_connect.dart';

class VendasRepository{
  final DioConnect _dioConnect = getx.Get.find<DioConnect>();
  Dio get _dio => _dioConnect.dio;


  Future<List<VendasModel>> getVendas({required DateTime dataInicial, required DateTime dataFinal})async{
    try{
      final response = await _dio.get('/vendas/periodo', queryParameters: {
        "dataInicial": dataInicial.toIso8601String(),
        "dataFinal": dataFinal.toIso8601String(),
      });
      return (response.data as List).map<VendasModel>((e) => VendasModel.fromJson(e)).toList();
    }
    on DioError catch(e){
      throw CustomException.fromDioError(e);
    }
    catch(e){
      throw CustomException(message: e.toString());
    }
  }
  
  Future<void> setVenda({required VendasModel vendasModel})async{
    try{
      await _dio.post('/vendas', data: {
        "venda": vendasModel.toJson(),
        "produtos": vendasModel.carrinho.produtos.map((e) => e.toJson()).toList(),  
      });
    }
    on DioError catch(e){
      throw CustomException.fromDioError(e);
    }
    catch(e){
      throw CustomException(message: e.toString());
    }
  }
}