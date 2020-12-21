import 'package:commerce/models/meal.dart';
import 'package:commerce/screens/meal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MealItem extends StatelessWidget {
  void selectMeal(BuildContext ctx)
   {
     Navigator.of(ctx).pushNamed(MealPage.routeName,arguments: id);
   }
   //I have used two different types of navigators, for the other type refer to categorypage

  final String title;
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  String get complexityText {
    switch(complexity)
    {
      case Complexity.Simple: return 'Simple';
      break;
      case Complexity.Simple: return 'Simple';
      break;
      case Complexity.Simple: return 'Simple';
      break;
      default:
      return 'Unkown';
    }

  }

  String get affordabilityText {
    switch(affordability)
    {
      case Affordability.Luxurious: return 'Luxurious';
      break;
      case Affordability.Pricey: return 'Pricey';
      break;
      case Affordability.Affordable: return 'Affordable';
      break;
      default:
      return 'Unkown';
    }
  }

  MealItem(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 5,
                  child: Container(
                    width: 250,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      "$title",
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                      ),
                    ),
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Row(children:[
                Icon(Icons.schedule),SizedBox(width:6),Text('$duration mins')
              ]),
              Row(children:[
                Icon(Icons.schedule),SizedBox(width:6),Text('$complexityText')
              ]),
              Row(children:[
                Icon(Icons.schedule),SizedBox(width:6),Text('$affordabilityText' )
              ]),
            ],),
          ],
        ),
      ),
    );
  }
}
