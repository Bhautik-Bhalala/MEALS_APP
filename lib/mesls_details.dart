import 'package:flutter/material.dart';

import 'dummy.dart';

class MealDetail extends StatelessWidget {
  const MealDetail({Key? key}) : super(key: key);
  static const routename = '/meal-detail';

  Widget buildSectiontitle(BuildContext context, String text) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context)?.settings.arguments;
    final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedmeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedmeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectiontitle(context, 'Ingredients'),
              buildContainer(
                ListView.builder(
                  itemCount: selectedmeal.ingredients.length,
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedmeal.ingredients[index]),
                    ),
                  ),
                ),
              ),
              buildSectiontitle(context, 'Steps'),
              buildContainer(ListView.builder(
                  itemCount: selectedmeal.steps.length,
                  itemBuilder: (ctx, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              child: Text('#${index + 1}'),
                            ),
                            title: Text(
                              selectedmeal.steps[index],
                            ),
                          ),
                          Divider(),
                        ],
                      )))
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
        ),
        onPressed: (){
          Navigator.of(context).pop(mealid);
        },
      ),
    );
  }
}
