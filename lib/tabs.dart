import 'package:flutter/material.dart';
import 'package:meals_app/catagoriesScreen.dart';
import 'package:meals_app/fav.dart';

class Tabs extends StatefulWidget {
  @override
  State<Tabs> createState() => _TabState();
}

class _TabState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Categories(),
            Fav(),

          ],
        ),
      ),
    );
  }
}
