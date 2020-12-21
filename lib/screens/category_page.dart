import 'package:commerce/models/dummy_data.dart';
import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

class CategoryPage extends StatelessWidget {
  //final String categoryID;
  //final String categoryTitle;

  //CategoryPage({@required this.categoryTitle,this.categoryID});
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    //here we use ModalRoute to extract the data send
    final categoryTitle = routeArgs['title'];
    final categoryID = routeArgs['id'];

    final categoryMeals = Dummy_Meals.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();
    //here returning meals that have categoryID of categories that we stated have in DummyCategories
    //that data is retrieved by routeArgs as initialized above, we are just comparing the ids for filtering output

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$categoryTitle Dishes",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Center(
              child: MealItem(id: categoryMeals[index].id,
                  title: categoryMeals[index].title,
                  imageUrl: categoryMeals[index].imageUrl,
                  duration: categoryMeals[index].duration,
                  affordability: categoryMeals[index].affordability,
                  complexity: categoryMeals[index].complexity,));
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
