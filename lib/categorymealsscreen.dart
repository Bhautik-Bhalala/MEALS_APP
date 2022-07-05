import 'package:flutter/material.dart';
import 'package:meals_app/MealItem.dart';
import 'dummy.dart';
import 'mealmodal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "categories_meals";
  // final String categoryId;
  // final String categoryTitle;
  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
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
          itemBuilder: (ctx, idx) {
            return MmealItem(
              categoryMeals[idx].id,
                categoryMeals[idx].title,
                categoryMeals[idx].imageUrl,
                categoryMeals[idx].duration,
                categoryMeals[idx].affordability,
                categoryMeals[idx].complexity,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
