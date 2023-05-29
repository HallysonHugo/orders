import 'package:sport_bar/modules/vendas/model/itvendas_model.dart';

class CartModel{
  int? idCarrinho;
  List<ItVendas> produtos = [];
  double get total => produtos.map((e) => e.total).reduce((value, element) => value + element);
  double get quantidade => produtos.map((e) => e.quantidade).reduce((value, element) => value + element);
  double get desconto => produtos.map((e) => e.desconto).reduce((value, element) => value + element);
}