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
  double? estoqueMinimo;
  bool promocao = false;
  double precoPromocao = 0.0;
  CategoriasModel categoria = CategoriasModel();
  String imagem = "";
  String? color;
  bool isFavorite = false;

  

  //TODO: pensar em um modo de controlar o desperdicio


  //TODO: Pagina igual de vendas para ir selecionando o item que foi desperdiçado "Sugestao Joao"

  //TODO: avisar caso o estoque tive zerado e avisar apenas quando atingir o estoque minimo

  //TODO: Controle de forma de pagamento, opcao de informar a quantidade paga pois podem rachar o valor total da venda


  ProdutosModel();


  ProdutosModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    descricao = json['descricao'];
    nomeEtiqueta = json['nomeEtiqueta'];
    preco = json['preco'] *1.0;
    estoque = json['estoque'] * 1.0;
    categoria = CategoriasModel.fromJson(json['categoria']);
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
      'id': id,
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