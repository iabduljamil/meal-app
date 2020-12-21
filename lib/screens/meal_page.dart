import 'package:commerce/models/dummy_data.dart';
import 'package:flutter/material.dart';

class MealPage extends StatelessWidget {
  static const routeName='Meal-Details';
  Widget build(BuildContext context) {
    final mealID = ModalRoute.of(context).settings.arguments as String;
    final selectionMeal=Dummy_Meals.firstWhere((meal)=>meal.id==mealID);
    //passed meal id from MealItem widget through argument of Navigator push

    Widget buildTitle(BuildContext context,String text)
    {
      return Container(
        margin: EdgeInsets.symmetric(vertical:10),
        child: Text(text, style: Theme.of(context).textTheme.bodyText1),
      );
    }

    return Scaffold(
      appBar: AppBar(title:Text(selectionMeal.title),),
      body: Column(children: [
      Container(
        height: (MediaQuery.of(context).size.height*0.4)-(MediaQuery.of(context).padding.top),
        child: Image.network(selectionMeal.imageUrl),
      ),
      buildTitle(context, 'Ingrediants'),
      Container(height:MediaQuery.of(context).size.height*.15,width: MediaQuery.of(context).size.width*.8,
      child: ListView.builder(itemBuilder: (ctx,index)=>Card(color: Theme.of(context).accentColor,child: Text(selectionMeal.ingredients[index]),),itemCount: selectionMeal.ingredients.length,),
      ),
      buildTitle(context, "Steps"),
      Container(
        height:(MediaQuery.of(context).size.height*.3)-(MediaQuery.of(context).padding.top),width:MediaQuery.of(context).size.width*3,child:ListView.builder(itemBuilder: (ctx,index)
        =>ListTile(
          leading: CircleAvatar(child: Text('${index}'),),
            title:Text(selectionMeal.steps[index]),       ),itemCount:selectionMeal.steps.length),
      )

      
      ],),
    );
  }
}
















