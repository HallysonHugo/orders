import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioConnect extends GetxController{

  BaseOptions baseOptions = BaseOptions(
    // baseUrl: "http://10.10.10.90:3000",
    // baseUrl: "http://192.168.100.13:3000",
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