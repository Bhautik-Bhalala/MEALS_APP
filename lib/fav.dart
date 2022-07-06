import 'package:flutter/material.dart';
import 'package:meals_app/MealItem.dart';
import 'package:meals_app/mealmodal.dart';

class Fav extends StatelessWidget {
  final List<Meal> favoriteMeals;

  Fav(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MmealItem(
            favoriteMeals[index].id,
            favoriteMeals[index].title,
            favoriteMeals[index].imageUrl,
            favoriteMeals[index].duration,
            favoriteMeals[index].affordability,
            favoriteMeals[index].complexity,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
