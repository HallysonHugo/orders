class CategoryModel{
  int? id;
  String descricao = '';


  CategoryModel();

  CategoryModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    descricao = json['descricao'] ?? '';
  }

  Map<String, dynamic> toJson() => {
    "descricao": descricao
  };
}