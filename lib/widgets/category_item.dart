

import 'package:flutter/material.dart';
import '../screens/category_page.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  

  CategoryItem(this.title, this.color,this.id);

  //through this constructor data from DummyData is retrieved here through catData function
  //Now we can pass on those values in this widget, such as using title, color, id 

  void selectPage(BuildContext ctx)
  {
   // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {return CategoryPage(categoryTitle: title,categoryID: id,);}));
    //we can pass in form for argunments and use named page routes
    Navigator.of(ctx).pushNamed('Categories',arguments: {'title':title,'id':id});
    
  }

  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>selectPage(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withRed(99), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
