import 'package:flutter/material.dart';

import 'dummy.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({Key? key}) : super(key: key);
  static const routename = '/meal-detail';

  @override
  Widget build(BuildContext context) {
     final mealid = ModalRoute.of(context)?.settings.arguments;
     final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
     return Scaffold(
         appBar: AppBar(title: Text('${selectedmeal.title}'),),
         body: Column(
           children: <Widget>[
             Container(
               height: 300 ,
               width: double.infinity,
               child: Image.network(selectedmeal.imageUrl,
                 fit: BoxFit.cover,),

             ),
             Container(
               child: Text("Ingredients",
               style: Theme.of(context).textTheme.titleMedium,),
             ),
             Container(
               height: 200,
               width: 300,
               child: ListView.builder(itemCount: selectedmeal.ingredients.length,
               itemBuilder: null,),
             ),
           ],
         ));
  }
}
