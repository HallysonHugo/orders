import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:sport_bar/modules/forma_pagamento/model/forma_pagamento_model.dart';
import 'package:sport_bar/services/dio_connect.dart';
import 'package:sport_bar/services/errors/exeption.dart';

class PagamentoRepository{
  late final Dio _dio;
  PagamentoRepository(){
    _dio = Get.find<DioConnect>().dio;
  }


  Future<List<FormaPagamentoModel>> getFormaPagamento({required String search})async{
    try{
      final response = await _dio.get('/forma_pagamento', queryParameters: {
        "search" : search
      });
      return response.data.map<FormaPagamentoModel>((json) => FormaPagamentoModel.fromJson(json)).toList();
    }
    on DioError catch(error){
      throw CustomException.fromDioError(error);
    }
    catch(e){
      throw CustomException(message: e.toString());
    }
  }
  
  Future<void> createFormaPagamento({required FormaPagamentoModel pagamentoModel})async{
    try{
      await _dio.post('/forma_pagamento', data: pagamentoModel.toJson());
    }
    on DioError catch(error){
      throw CustomException.fromDioError(error);
    }
    catch(e){
      throw CustomException(message: e.toString());
    }
  }
}