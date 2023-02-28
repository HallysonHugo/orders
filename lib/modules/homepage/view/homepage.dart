import 'package:flutter/material.dart';
import 'package:sport_bar/utils/size_util.dart';
import 'package:sport_bar/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              const CustomDrawer(),
              Container(
                alignment: Alignment.center,
                width: DeviceSize.getDeviceWidth(context) * 0.92,
                child: Image.asset("assets/images/LOGO ARENA.png"),
              )
            ],
          )
        ],
      )
    );
  }
}