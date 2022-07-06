import 'package:flutter/material.dart';
import 'package:meals_app/catagoriesScreen.dart';
import 'package:meals_app/filters.dart';
import 'package:meals_app/mesls_details.dart';
import 'package:meals_app/tabs.dart';
import 'categorymealsscreen.dart';
import 'mealmodal.dart';
import 'dummy.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const MyApp({Key? key}) : super(key: key);
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
    _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.blue,
        canvasColor: Color.fromRGBO(87,221,214,1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
        ),
      ),
      // home: Categories(),
      initialRoute: '/',
      routes: {
        '/' :(ctx)=> Tabs(_favoriteMeals),
        CategoryMealsScreen.routeName :(ctx) => CategoryMealsScreen(_availableMeals),
        MealDetail.routename :(ctx) => MealDetail(_toggleFavorite, _isMealFavorite),
        Filterss.routeName : (ctx) => Filterss(_filters, _setFilters) ,
      },
      onGenerateRoute: (settings){
        print(settings.arguments);
        // return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => Categories());
      },
    );
  }
}

