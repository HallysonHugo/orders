import 'package:get/get.dart';
import 'package:sport_bar/modules/configuracoes/model/config_model.dart';
import 'package:sport_bar/modules/configuracoes/repository/config_repository.dart';
import 'package:sport_bar/services/dio_connect.dart';

class ConfigController extends GetxController{

  final Rx<ConnectionType> connectionType = ConnectionType.http.obs;
  ConfigModel configModel = ConfigModel();
  final ConfigRepository _configRepository = ConfigRepository();
  RxBool isLoading = false.obs;

  Future<void> saveIsarConfig()async{
    try{
      await _configRepository.saveIsarConfig(configModel: configModel);
    }
    catch(e){
      rethrow;
    }
  }

  Future<void> getConfig()async{
    try{
      DioConnect dioConnect = Get.find<DioConnect>();
      configModel = await _configRepository.getConfiguration();
      connectionType.value = configModel.connectionType;
      dioConnect.setDioData(baseUrl: configModel.baseUrl);
    }
    catch(e){
      rethrow;
    }

  }

  @override
  void onInit() {
    getConfig();
    super.onInit();
  }
}