import 'package:flutter/material.dart';
import 'package:sport_bar/widgets/drawer.dart';


class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
            const CustomDrawer(),
          Column(
            children: [
              
            ],
          )
        ],
      ),
    );
  }
}