import 'package:flutter/material.dart';
import 'package:meals_app/Drawer.dart';
import 'package:meals_app/catagoriesScreen.dart';
import 'package:meals_app/fav.dart';

class Tabs extends StatefulWidget {
  @override
  State<Tabs> createState() => _TabState();
}

class _TabState extends State<Tabs> {
  final List<Map<String , Widget>> _pages = [
    {'page' : Categories() , 'title' : Text('Categories')},
    {'page' : Fav() , 'title' : Text('Your Favourites')},
  ];

  int _selelctedpageindex = 0;

  void _selectpage(int index) {
    setState(() {
      _selelctedpageindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _pages[_selelctedpageindex]['title'],
      ),
      drawer: Drawer(
        child: Drawer1(),
      ),
      body: _pages[_selelctedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black ,
        selectedItemColor: Theme.of(context).accentColor ,
        currentIndex: _selelctedpageindex,
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
