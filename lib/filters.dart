import 'package:flutter/material.dart';
import 'package:meals_app/Drawer.dart';

class Filterss extends StatelessWidget {
  const Filterss({Key? key}) : super(key: key);

  static const routeName = '/filters';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: Drawer(
        child: Drawer1(),
      ),
      body: Container(),
    );
  }
}
