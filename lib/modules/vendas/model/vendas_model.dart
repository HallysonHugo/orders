import 'package:sport_bar/modules/produtos/model/produtos_model.dart';
import 'package:sport_bar/modules/vendas/model/itvendas_model.dart';

class VendasModel{
  late int codigo;
  DateTime data = DateTime.now();
  DateTime hora = DateTime.now();
  String cliente = "";
  String vendedor = "";
  double get desconto => produtos.map((e) => e.desconto).reduce((value, element) => value + element);
  List<ItVendas> produtos = [];
  double get total => produtos.map((e) => e.total).reduce((value, element) => value + element);
  double get quantidade => produtos.map((e) => e.quantidade).reduce((value, element) => value + element);


  VendasModel.fromJson(Map<String, dynamic> json){
    codigo = json['codigo'];
    data = DateTime.parse(json['data']);
    hora = DateTime.parse(json['hora']);
    cliente = json['cliente'];
    vendedor = json['vendedor'];
    produtos = json['produtos'].map<ProdutosModel>((e) => ProdutosModel.fromJson(e)).toList();
  }

  toJson(){
    return {
      'codigo': codigo,
      'data': data.toString(),
      'hora': hora.toString(),
      'cliente': cliente,
      'vendedor': vendedor,
      'produtos': produtos.map((e) => e.toJson()).toList()
    };
  }
}