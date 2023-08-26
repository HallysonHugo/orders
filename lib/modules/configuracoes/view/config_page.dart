import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/configuracoes/controller/config_controller.dart';
import 'package:sport_bar/modules/configuracoes/model/config_model.dart';
import 'package:sport_bar/services/errors/exeption.dart';
import 'package:sport_bar/widgets/buttons/custom_elevatedbutton.dart';
import 'package:sport_bar/widgets/dialogs/custom_dialog.dart';
import 'package:sport_bar/widgets/drawer.dart';
import 'package:network_info_plus/network_info_plus.dart';


class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _portaController = TextEditingController();
  final ConfigController _configController = Get.find();

  @override
  void initState() {
    _ipController.text = _configController.configModel.baseUrl;
    _portaController.text = _configController.configModel.porta.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const CustomDrawer(),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.94 ,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        children: [
                          Expanded(
                            child: Obx(() {
                              return TextField(
                                enabled: !_configController.useLocalIp.value,
                                controller: _ipController,
                                decoration:  InputDecoration(
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                                    child: Obx(() {
                                      return DropdownButtonHideUnderline(
                                        child: DropdownButton<ConnectionType>(
                                          value: _configController.connectionType.value,
                                          items: [
                                            DropdownMenuItem(value: ConnectionType.http, child: Text(ConnectionType.http.description)),
                                            DropdownMenuItem(value: ConnectionType.https, child: Text(ConnectionType.https.description)),
                                          ], 
                                          onChanged: (value){
                                            _configController.connectionType.value = value ?? ConnectionType.http;
                                          }
                                        ),
                                      );
                                    }
                                    ),
                                  ),
                                  labelText: "IP Servidor",
                                  hintText: "IP Servidor",
                                  border: const OutlineInputBorder(),
                                ),
                              );
                              }
                            ),
                          ),
                          const SizedBox(width: 10,),
                          SizedBox(
                            width: 100,
                            child: TextField(
                              controller: _portaController,
                              decoration:  const InputDecoration(
                                labelText: "Porta",
                                hintText: "Porta",
                                border: OutlineInputBorder(),
                              ),
                            ),
                          )   
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Usar IP Local'),
                            Checkbox(
                              activeColor: Colors.greenAccent[400],
                              value: _configController.useLocalIp.value, 
                              onChanged: (value){
                                _configController.useLocalIp.value = value ?? false;
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 10,),
                    CustomElevatedButton(
                      text: 'Buscar Logo', 
                      onPressed: ()async{
                        PlatformFile file = await _configController.pickLogoImage();
                        _configController.configModel.imageLogo = file.path ?? "";
                      }
                    ),
                    const SizedBox(height: 10,),

                    CustomElevatedButton(
                      text: 'Salvar', 
                      onPressed: ()async{
                        try{
                          _configController.configModel.useLocalIp = _configController.useLocalIp.value;
                          if(_configController.useLocalIp.value){
                            _configController.configModel.connectionType = ConnectionType.http;
                            String? ip = await NetworkInfo().getWifiIP();
                            if(ip == null){
                              throw CustomException(message: 'Nenhum IP encontrado');
                            }
                            _configController.configModel.baseUrl = ip;
                            _configController.configModel.porta = _portaController.text;
                          }
                          else{
                            _configController.configModel.connectionType = _configController.connectionType.value;
                            _configController.configModel.baseUrl = _ipController.text;
                            _configController.configModel.porta = _portaController.text;
                          }
                          await _configController.saveIsarConfig();
                          await _configController.getConfig();
                          await CustomDialog.sucessDialog(text: 'Configurações salvas com sucesso!');
                        }catch(e){
                          CustomDialog.erroDialog(text: e.toString());
                        }
                      }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}