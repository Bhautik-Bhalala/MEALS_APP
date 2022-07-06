import 'package:flutter/material.dart';
import 'package:meals_app/Drawer.dart';
import 'package:meals_app/catagoriesScreen.dart';
import 'package:meals_app/fav.dart';
import 'mealmodal.dart';

class Tabs extends StatefulWidget {
  final List<Meal> favoriteMeals;

  Tabs(this.favoriteMeals);
  @override
  State<Tabs> createState() => _TabState();
}

class _TabState extends State<Tabs> {
  List<Map<String, Widget>> _pages = [];
  int _selectedPageIndex = 0;

  // _TabState(this._pages)

  @override
  void initState() {
    _pages = [
      {
        'page': Categories(),
        'title': Text('Categories'),
      },
      {
        'page': Fav(widget.favoriteMeals),
        'title': Text('Your Favorite'),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_selectedPageIndex]['title'],
      ),
      drawer: Drawer1(),
      // Drawer(
      //   child: Drawer1(),
      // ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black ,
        selectedItemColor: Theme.of(context).accentColor ,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items:  [
        BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(
              Icons.category,
            ),
            label: "Categories"),
        BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.star,
            ),
            label: "Favourites"),
        // BottomNavigationBarItem(icon: Icon(Icons.layers), label: "Item"),
        // BottomNavigationBarItem(
        //     icon: Icon(Icons.person), label: "Accounts"),
        ],
      ),
    );
  }
}
