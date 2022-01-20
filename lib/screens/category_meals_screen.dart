import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  // const CategoryMealsScreen(this.categoryId, this.categoryTitle, {Key? key})
  //     : super(key: key);
  // final categoryId;
  // final categoryTitle;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                affordability: categoryMeals[index].affordability,
                complexity: categoryMeals[index].complexity,
                duration: categoryMeals[index].duration,
                imageUrl: categoryMeals[index].imageUrl,
                title: categoryMeals[index].title);
          },
          itemCount: categoryMeals.length,
        ));
  }
}