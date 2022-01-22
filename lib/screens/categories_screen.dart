import 'package:flutter/material.dart';
import '../widgets/category_items.dart';
import '../models/dummy_data.dart';

//the main screen which shows the categories in a grid layout. pressing on the grids should take the user to the information meal.
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(20),
        children: [
          ...DUMMY_CATEGORIES.map((e) {
            return CategoryItem(e.id, e.title, e.color);
          }).toList()
        ],
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20));
  }
}
