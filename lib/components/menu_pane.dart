import 'package:flutter/material.dart';
import '../datasource/all_dishes_hard_code.dart';

class MenuPane extends StatelessWidget {
  const MenuPane({
    super.key,
    required this.categoriesList,
    required this.filter,
  });

  final List<String> categoriesList;
  final String filter;

  @override
  Widget build(BuildContext context) {
    Datasource datasource = Datasource(categoriesList);

    return Expanded(
      child: GridView(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: datasource.getDatasource(filter),
      ),
    );
  }
}
