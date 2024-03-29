import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sport_bar/modules/configuracoes/model/config_model.dart';
import 'package:sport_bar/modules/configuracoes/repository/config_repository.dart';
import 'package:sport_bar/services/dio_connect.dart';
import 'package:sport_bar/services/errors/exeption.dart';

class ConfigController extends GetxController{

  ConfigController(){
    getPackageInfo();
  }

  final Rx<ConnectionType> connectionType = ConnectionType.http.obs;
  ConfigModel configModel = ConfigModel();
  final ConfigRepository _configRepository = ConfigRepository();
  RxBool isLoading = false.obs;
  RxBool useLocalIp = false.obs;

  late final PackageInfo packageInfo;

  Future<void> saveIsarConfig()async{
    try{
      await _configRepository.saveIsarConfig(configModel: configModel);
    }
    catch(e){
      rethrow;
    }
  }


  Future<void> getPackageInfo()async{
    packageInfo = await PackageInfo.fromPlatform();
  }

  Future<void> getConfig()async{
    try{
      DioConnect dioConnect = Get.find<DioConnect>();
      configModel = await _configRepository.getConfiguration();
      useLocalIp.value = configModel.useLocalIp;
      if(useLocalIp.value){
        connectionType.value = ConnectionType.http;
        configModel.baseUrl = await NetworkInfo().getWifiIP() ?? "";
      }
      connectionType.value = configModel.connectionType;
      dioConnect.setDioData(baseUrl: '${configModel.connectionType.description}${configModel.baseUrl}:${configModel.porta}');
    }
    catch(e){
      rethrow;
    }
  }
  Future<PlatformFile> pickLogoImage()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );
    if(result == null){
      throw CustomException(message: 'Nenhum arquivo selecionado');
    }
    return result.files.single;
  }


  @override
  void onInit() {
    getConfig();
    super.onInit();
  }
}