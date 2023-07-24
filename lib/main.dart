import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:sport_bar/modules/configuracoes/controller/config_controller.dart';
import 'package:sport_bar/modules/configuracoes/model/config_model.dart';
import 'package:sport_bar/modules/homepage/view/homepage.dart';
import 'package:sport_bar/services/dio_connect.dart';
import 'package:sport_bar/utils/custom_theme.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DioConnect());
  
  final dir = await getApplicationDocumentsDirectory();
  await Isar.open([
    ConfigModelSchema
  ],
  directory: dir.path,
  );
  Get.put(ConfigController());
  runApp(const AppWidget());
}


class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    theme: CustomThemeData.themeData(context),
    builder: (BuildContext context, Widget? child) {
      return ResponsiveWrapper.builder(
        child,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(480, name: MOBILE),
          const ResponsiveBreakpoint.resize(600, name: DESKTOP),
        ],
        background: Container(
          color: const Color(0xFFF5F5F5),
        ),
      );
    },
    debugShowCheckedModeBanner: false,
    home: const HomePage()
  );
  }
}

