import 'package:flutter/material.dart';
import 'package:sport_bar/widgets/scaffold/custom_scaffold.dart';
import 'package:sport_bar/widgets/search_widget.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            hintText: "Descrição",
            controller: _searchController,
          )
        ],
      )
    );
  }
}