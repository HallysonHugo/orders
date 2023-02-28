import 'package:flutter/material.dart';
import 'package:sport_bar/widgets/drawer.dart';


class RelatoriosPage extends StatelessWidget {
  const RelatoriosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          CustomDrawer(),
        ],
      )
    );
  }
}