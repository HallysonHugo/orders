class CategoryModel{
  int? id;
  String nome = '';


  CategoryModel();

  CategoryModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    nome = json['nome'] ?? '';
  }

  Map<String, dynamic> toJson() => {
    "nome": nome
  };
}