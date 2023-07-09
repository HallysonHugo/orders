import 'package:flutter/material.dart';
import 'package:sport_bar/widgets/drawer.dart';

class CustomScaffold extends StatefulWidget {
  final Widget body;
  final Alignment alignment;
  const CustomScaffold({super.key, required this.body, this.alignment = Alignment.center});

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const CustomDrawer(),
          Container(
            alignment: widget.alignment,
            width: MediaQuery.of(context).size.width * 0.94 ,
            child: widget.body,
          )
        ],
      ),
    );
  }
}