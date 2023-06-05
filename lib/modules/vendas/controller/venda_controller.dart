import 'package:get/get.dart';
import 'package:sport_bar/modules/vendas/model/itvendas_model.dart';
import 'package:sport_bar/modules/vendas/model/vendas_model.dart';
import 'package:sport_bar/modules/vendas/repository/vendas_repository.dart';

class VendasController extends GetxController {
  final VendasRepository _vendasRepository = VendasRepository();
  RxBool isLoading = false.obs;
  RxList<ItVendas> itensVenda = <ItVendas>[].obs;

  void addItensVenda({required ItVendas itVendas}){
    itensVenda.add(itVendas);
  }

  Future<void> setVenda() async {
    try {
      VendasModel vendasModel = VendasModel();
      vendasModel.carrinho.produtos = itensVenda; 
      isLoading.value = true;
      await _vendasRepository.setVenda(vendasModel: vendasModel);
    } catch (e) {
      rethrow;
    } finally{
      isLoading.value = false;
    }
  }
}