import 'package:get/get.dart';
import 'package:sport_bar/modules/vendas/model/itvendas_model.dart';
import 'package:sport_bar/modules/vendas/model/vendas_model.dart';
import 'package:sport_bar/modules/vendas/repository/vendas_repository.dart';
import 'package:sport_bar/services/response.dart';

class VendasController extends GetxController {
  final VendasRepository _vendasRepository = VendasRepository();
  RxBool isLoading = false.obs;
  RxList<ItVendas> itensVenda = <ItVendas>[].obs;

  Rx<CustomResponse<List<VendasModel>>> listVendas = CustomResponse<List<VendasModel>>.none().obs;

  Future<List<VendasModel>> getVendas({DateTime? dataInicial, DateTime? dataFinal})async{
    try{
      final List<VendasModel> vendas = await _vendasRepository.getVendas(
        dataInicial: dataInicial ?? DateTime.now(), 
        dataFinal: dataFinal ?? DateTime.now());
      return vendas;
    }
    catch(e){
      rethrow;
    }
  }

  Future<void> getAllvendas()async{
    throw UnimplementedError();
    //Todo: implementar
  }

  void addItensVenda({required ItVendas itVendas}){
    ItVendas? item = itensVenda.firstWhereOrNull((element) => element.produtosModel.id == itVendas.produtosModel.id);
    if(item == null){
      itensVenda.add(itVendas);
      itensVenda.refresh();
      return;
    }
    item.quantidade ++;
    itensVenda.refresh();
  }

  void removeItemVenda({required ItVendas itVendas}){
    if(itVendas.quantidade > 1){
      itVendas.quantidade --;
      itensVenda.refresh();
      return;
    }
    itensVenda.remove(itVendas);
    itensVenda.refresh();
  }

  Future<void> setVenda({required VendasModel vendasModel}) async {
    try {
      isLoading.value = true;
      await _vendasRepository.setVenda(vendasModel: vendasModel);
      itensVenda.clear();
    } catch (e) {
      rethrow;
    } finally{
      isLoading.value = false;
    }
  }
}