import 'package:sport_bar/modules/vendas/model/itvendas_model.dart';

class CartModel{
  int? idCarrinho;
  List<ItVendas> produtos = [];
  double get total => produtos.fold(0, (previousValue, element) => previousValue + element.total);
  double get quantidade => produtos.fold(0, (previousValue, element) => previousValue + element.quantidade);
  double get desconto => produtos.fold(0, (previousValue, element) => previousValue + element.desconto);
}