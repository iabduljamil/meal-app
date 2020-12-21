import 'package:flutter/material.dart';
import '../models/dummy_data.dart';
import '../widgets/category_item.dart';

class Categories extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Meal Categories",style: Theme.of(context).textTheme.headline1,),centerTitle: true,),
          body: GridView(padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 3 / 2, crossAxisSpacing: 20,mainAxisSpacing:20,maxCrossAxisExtent: 200),
        children: 
          DummyCategories.map((catData) => CategoryItem(catData.title, catData.color,catData.id)).toList()
        //Maps is used above, it gets data from DummyData class through function "catData"
        //catData function than assign it to variables in "CategoryItem" widget class
        
      ),
    );
  }
}
