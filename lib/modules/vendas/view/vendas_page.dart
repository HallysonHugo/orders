import 'package:flutter/material.dart';
import 'package:sport_bar/widgets/drawer.dart';

class VendasPage extends StatelessWidget {
  const VendasPage({super.key});

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
      )
    );
  }
}