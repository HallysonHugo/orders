import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:sport_bar/modules/forma_pagamento/model/forma_pagamento_model.dart';
import 'package:sport_bar/services/dio_connect.dart';
import 'package:sport_bar/services/errors/exeption.dart';

class PagamentoRepository{
  final DioConnect _dioConnect = Get.find<DioConnect>();


  Future<List<FormaPagamentoModel>> getFormaPagamento({required String search})async{
    try{
      final response = await _dioConnect.dio.get('/forma_pagamento', queryParameters: {
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
      await _dioConnect.dio.post('/forma_pagamento', data: pagamentoModel.toJson());
    }
    on DioError catch(error){
      throw CustomException.fromDioError(error);
    }
    catch(e){
      throw CustomException(message: e.toString());
    }
  }
}