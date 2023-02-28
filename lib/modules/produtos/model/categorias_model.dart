class CategoriasModel{
  int? id;
  String? nome;
  String? imagem;

  CategoriasModel();


  CategoriasModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    nome = json['nome'];
    imagem = json['imagem'];
  }

  CategoriasModel.fromProdutosJson(Map<String, dynamic> json){
    id = json['categoria'];
  }

  toJson(){
    return {
      'id': id,
      'nome': nome,
      'imagem': imagem,
    };
  }
}