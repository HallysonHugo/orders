import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:isar/isar.dart';
import 'package:sport_bar/modules/configuracoes/model/config_model.dart';
import 'package:sport_bar/services/dio_connect.dart';
import 'package:sport_bar/services/errors/exeption.dart';
class ConfigRepository{
  final DioConnect dioConnect = getx.Get.find<DioConnect>();
  Dio get dio => dioConnect.dio;
  final Isar isar = Isar.getInstance()!;


  Future<void> saveIsarConfig({required ConfigModel configModel})async{
    try{
      await isar.writeTxn(()async{
        await isar.configModels.put(configModel);
      });
    }
    catch(e){
      throw CustomException(message: e.toString());
    }
  }

  Future<ConfigModel> getConfiguration()async{
    try{
      ConfigModel configModel = await isar.configModels.where().findFirst() ?? ConfigModel();
      return configModel; 
    }
    catch(e){
      throw CustomException(message: e.toString());
    }
  }
}