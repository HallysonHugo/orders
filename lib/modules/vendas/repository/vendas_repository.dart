import 'package:dio/dio.dart';
import 'package:get/get.dart'as getx;
import 'package:sport_bar/modules/vendas/model/vendas_model.dart';
import 'package:sport_bar/services/errors/exeption.dart';

import '../../../services/dio_connect.dart';

class VendasRepository{
  final DioConnect _dioConnect = getx.Get.find<DioConnect>();
  Dio get _dio => _dioConnect.dio;
  
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