import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioConnect extends GetxController{

  BaseOptions baseOptions = BaseOptions(
    connectTimeout: 15000,
    receiveTimeout: 15000,
    headers: {
      'Content-Type': 'application/json',
      },
    );

    Dio dio = Dio();

    void setDioData({required String baseUrl}){
      baseOptions.baseUrl = baseUrl;
      dio.options = baseOptions;
    }
}