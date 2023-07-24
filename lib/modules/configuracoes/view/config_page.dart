import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/configuracoes/controller/config_controller.dart';
import 'package:sport_bar/modules/configuracoes/model/config_model.dart';
import 'package:sport_bar/widgets/buttons/custom_elevatedbutton.dart';
import 'package:sport_bar/widgets/dialogs/custom_dialog.dart';
import 'package:sport_bar/widgets/drawer.dart';


class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final TextEditingController _ipController = TextEditingController();
  final ConfigController _configController = Get.find();

  @override
  void initState() {
    _ipController.text = _configController.configModel.baseUrl;
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
                      child: TextField(
                        controller: _ipController,
                        decoration:  InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Obx(() {
                              return DropdownButtonHideUnderline(
                                child: DropdownButton<ConnectionType>(
                                  value: _configController.connectionType.value,
                                  items: [
                                    DropdownMenuItem(value: ConnectionType.http, child: Text(ConnectionType.http.name)),
                                    DropdownMenuItem(value: ConnectionType.https, child: Text(ConnectionType.https.name)),
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
                      ),
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
                          _configController.configModel.connectionType = _configController.connectionType.value;
                          _configController.configModel.baseUrl = _ipController.text;
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