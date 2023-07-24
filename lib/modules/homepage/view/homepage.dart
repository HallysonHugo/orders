import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_bar/modules/configuracoes/controller/config_controller.dart';
import 'package:sport_bar/utils/size_util.dart';
import 'package:sport_bar/widgets/scaffold/custom_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ConfigController _configController = Get.find();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(_configController.configModel.imageLogo.isNotEmpty)...[
            Container(
              alignment: Alignment.center,
              width: DeviceSize.getDeviceWidth(context) * 0.92,
              child: Image.file(
                File(_configController.configModel.imageLogo)
              ),
            )
          ],
        ],
      ),
    );
  }
}