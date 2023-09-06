class FormaPagamentoModel{
  int? id;
  String descricao = '';
  PaymentType paymentType = PaymentType.aVista;
  int parcelas = 1;

  FormaPagamentoModel();


  FormaPagamentoModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    descricao = json['descricao'] ?? '';
    paymentType = paymentType.fromString(data: json['paymentType']);
  }
  Map<String, dynamic> toJson(){
    return {
      "descricao": descricao,
      "paymentType": paymentType.name,
    };
  }
}


enum PaymentType{
  aVista,
  aPrazo,
}

extension PaymentTypeExtension on PaymentType{
  String get name{
    switch(this){
      case PaymentType.aVista:
        return 'À Vista';
      case PaymentType.aPrazo:
        return 'À Prazo';
    }
  }

  PaymentType fromString({required String data}){
    switch(data){
      case 'À Vista':
        return PaymentType.aVista;
      case 'À Prazo':
        return PaymentType.aPrazo;
      default:
        return PaymentType.aVista;
    }
  }
}