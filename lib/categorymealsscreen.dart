import 'package:flutter/material.dart';
import 'package:meals_app/MealItem.dart';
import 'dummy.dart';
import 'mealmodal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "categories_meals";

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String categoryId;
  String categoryTitle = '';
  List<Meal> displayMeals = [];
  var  _loadedinitialData = false;


  void initState(){
    //..
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedinitialData){
      final routeArgs =
      ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title']!;
      final categoryId = routeArgs['id'];
      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedinitialData = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal (String mealId){
    setState(() {
      displayMeals.removeWhere((element) => element.id == mealId);
    });

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, idx) {
            return MmealItem(
              displayMeals[idx].id,
              displayMeals[idx].title,
              displayMeals[idx].imageUrl,
              displayMeals[idx].duration,
              displayMeals[idx].affordability,
              displayMeals[idx].complexity,
              // _removeMeal,
            );
          },
          itemCount: displayMeals.length,
        ));
  }
}
