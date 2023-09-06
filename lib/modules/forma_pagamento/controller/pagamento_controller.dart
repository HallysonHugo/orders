import 'package:get/get.dart';
import 'package:sport_bar/modules/forma_pagamento/model/forma_pagamento_model.dart';
import 'package:sport_bar/modules/forma_pagamento/repository/pagamento_repository.dart';
import 'package:sport_bar/services/errors/exeption.dart';
import 'package:sport_bar/services/response.dart';

class PagamentoController extends GetxController{
  Rx<CustomResponse<List<FormaPagamentoModel>>> formasPagamento = CustomResponse<List<FormaPagamentoModel>>.none().obs;
  final PagamentoRepository _pagamentoRepository = PagamentoRepository();

  Future<void> getFormaPagamento({String search = ''})async{
    try{
      formasPagamento.value = CustomResponse.loading();
      formasPagamento.value = CustomResponse.completed(data: await _pagamentoRepository.getFormaPagamento(search: search));
    }
    catch(e){
      formasPagamento.value = CustomResponse.error(error: CustomException(message: e.toString()));
    }
  }
}