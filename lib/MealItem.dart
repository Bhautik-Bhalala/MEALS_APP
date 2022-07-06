import 'package:flutter/material.dart';
import 'package:meals_app/mealmodal.dart';
import 'package:meals_app/mesls_details.dart';

class MmealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageURL;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  // final Function removeitem;

  MmealItem(
      this.id,
      this.title,
      this.imageURL,
      this.duration,
      this.affordability,
      this.complexity,
      // this.removeitem
      );

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }
  String get affordibilityText {
    switch (affordability) {
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectmeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetail.routename,
      arguments: id ).then((value) => {
        if (value != null){
           // removeitem(value),
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>selectmeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageURL,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 220,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${duration} min'),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${complexityText}'),
                    ],
                  ),

                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${affordibilityText}'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
