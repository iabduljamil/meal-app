import 'package:commerce/screens/category_page.dart';
import 'package:commerce/screens/meal_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'screens/categories.dart';
import './screens/meal_page.dart';


void main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> 
{
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline1: TextStyle(
                  wordSpacing: 2, fontSize: 29, color: Colors.white))),
      home: Categories(),
      routes: {'Categories':(ctx){return CategoryPage();},
      //'Meal-Detail':(ctx){return MealPage();
      MealPage.routeName: (ctx)=>MealPage(),
      //route names using different approaches but are same
      
      }
    
    );
  }
}
