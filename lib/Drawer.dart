import 'package:flutter/material.dart';
import 'package:meals_app/filters.dart';

class Drawer1 extends StatelessWidget {
  const Drawer1({Key? key}) : super(key: key);

  Widget buildTile(String title , IconData icon , void Function() tapHandler){
    return  ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(title,
        style: TextStyle(
          fontSize:24 ,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
        // Navigator.of(context).pushReplacementNamed(nav);
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildTile('Meals', Icons.restaurant ,() {
      Navigator.of(context).pushReplacementNamed('/');}),
          buildTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(Filterss.routeName);
          })
        ],
      ),
    );
  }
}
