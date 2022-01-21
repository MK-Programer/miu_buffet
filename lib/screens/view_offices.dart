// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/admin_side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/admin_top_bar.dart';

class viewoffices extends StatefulWidget {
  @override
  _viewoffices createState() => _viewoffices();
}

class _viewoffices extends State<viewoffices> {
  // Dummy Product Data Here
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminSideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AdminTopBar('View Ofiicers'),
      ),
        body: Container(
         child: ListView.builder(
            itemCount: myProducts.length,
            itemBuilder: (BuildContext ctx, index) {
              // Display the list item
              return Dismissible(
                key: UniqueKey(),

                // only allows the user swipe from right to left
                direction: DismissDirection.endToStart,

                // Remove this product from the list 
                // In production enviroment, you may want to send some request to delete it on server side
                onDismissed: (_){
                  setState(() {
                    myProducts.removeAt(index);
                  });
                },

                // Display item's title, price...
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(0xFFA83332),
                      child: Text(myProducts[index]["id"].toString()),
                    ),
                    title: Text(myProducts[index]["title"]),
                    /*
                    subtitle:
                        Text("\$${myProducts[index]["price"].toString()}"),
                    */
                    trailing: Icon(Icons.arrow_back),
                  ),
                ),

                // This will show up when the user performs dismissal action
                // It is a red background and a trash icon
                background: Container(
                  color: Colors.red,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              );
            },
),
        ));
  }
}

// Dummy Product Data Here
  List myProducts = List.generate(7, (index) {
    return {"id": index, "title": "Office"};
  });


  