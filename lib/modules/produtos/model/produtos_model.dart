import 'package:sport_bar/modules/produtos/model/categorias_model.dart';

class ProdutosModel{
  int? id;
  String descricao = "";
  String? nomeEtiqueta;
  double preco = 0.0;
  double get precoVenda{
    if(promocao){
      return precoPromocao;
    }
    return preco;
  }
  String unidades = "";
  double estoque = 0.0;
  double estoqueMinimo = 0.0;
  bool promocao = false;
  double precoPromocao = 0.0;
  CategoriasModel categoria = CategoriasModel();
  String imagem = "";
  String? color;
  bool isFavorite = false;

  


  ProdutosModel();


  ProdutosModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    descricao = json['descricao'];
    nomeEtiqueta = json['nomeEtiqueta'];
    preco = json['preco'] *1.0;
    estoque = json['estoque'] * 1.0;
    imagem = json['imagem'] ?? "";
    promocao = json['promocao'] ?? false;
    isFavorite = json['isFavorite'] ?? false;
    color = json['color'];
    categoria.id = json['idCategoria'];
  }
  ProdutosModel.fromItVendasJson(Map<String, dynamic> json){
    id = json['codigo'];
    descricao = json['descricao'];
    preco = json['preco'];
  }



  toJson(){
    return {
      'descricao': descricao,
      'nomeEtiqueta': nomeEtiqueta,
      'preco': preco,
      'estoque': estoque,
      "idCategoria": categoria.id,
      "imagem": imagem,
      "color": color,
      "promocao": promocao,
      "precoPromocao": precoPromocao,
      "estoqueMinimo": estoqueMinimo,
      "unidades": "UN"
    };
  }
}