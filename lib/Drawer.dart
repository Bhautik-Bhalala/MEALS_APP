import 'package:flutter/material.dart';

class Drawer1 extends StatelessWidget {
  const Drawer1({Key? key}) : super(key: key);

  Widget buildTile(String title , IconData icon , String nav , BuildContext context){
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
      onTap: (){
        Navigator.of(context).pushReplacementNamed(nav);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        buildTile('Meals', Icons.restaurant ,'/',context),
        buildTile('Filters', Icons.settings,'/filters',context)
      ],
    );
  }
}
