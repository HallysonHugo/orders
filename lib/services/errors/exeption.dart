import 'package:dio/dio.dart';


class CustomException implements Exception {
  String message;

  CustomException({this.message = ''});



  factory CustomException.fromDioError(DioError dioError) {
    getHttpErrorDescription(DioError dioError) {
      switch (dioError.response!.statusCode) {
        case 400:
          return "Não foi possível processar sua requisição.";
        case 401:
          return "Não foi possível autenticar o usuário.";
        case 403:
          return "Verifique se o usuário possui as permissões necessárias para acessar o app.";
        case 500:
          return "Ocorreu um erro no servidor, por favor entre em contato com o desenvolvedor.";
        default:
          return "Erro desconhecido.";
      }
    }

    getDioErrorDescription(DioError dioError) {
      switch (dioError.type) {
        case DioErrorType.connectTimeout:
          return "Não foi possível se conectar à API. Verifique sua conexão";
        case DioErrorType.receiveTimeout:
          return "O servidor não respondeu a solicitação.\nTente novamente.";
        case DioErrorType.sendTimeout:
          return "Falha ao enviar a requisição para o servidor.";
        case DioErrorType.cancel:
          return "A requisição foi cancelada.\nTente novamente.";
        default:
          if (dioError.response != null) {
            return getHttpErrorDescription(dioError);
          }
          return "Erro desconhecido.\n${dioError.message}";
      }
    }

    if (dioError.response == null) {
      return CustomException(message: getDioErrorDescription(dioError));
    } else {
      return CustomException(message: getHttpErrorDescription(dioError));
    }
  }

  @override
  String toString() {
    return message;
  }
  static verifyFields({required Response response, required String message}){
    if(response.data.containsKey("errors") && response.data['errors'].isNotEmpty){
      return response.data['message'];
    }
    return message;
  }
}