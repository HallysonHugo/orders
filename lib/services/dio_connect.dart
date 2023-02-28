import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DioConnect extends GetxController{

  BaseOptions baseOptions = BaseOptions(
    baseUrl: "http://10.10.10.64:3000",
    connectTimeout: 15000,
    receiveTimeout: 15000,
    headers: {
      'Content-Type': 'application/json',
      },
    );

    Dio dio = Dio();

   
  @override
  void onInit() {
    dio.options = baseOptions;
    print('sucesso');
    super.onInit();
  }
}