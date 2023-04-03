import 'package:flutter/material.dart';
import 'package:zoody/models/food_categories_modle.dart';
import 'package:zoody/screen/Widget/HomePage.dart';
import 'package:zoody/screen/Widget/bottom_container.dart';
import 'package:zoody/screen/Widget/detail_page.dart';

// ignore: must_be_immutable
class Categories extends StatelessWidget {
  List<FoodCategoriesModle> list = [];
  Categories({required this.list});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: GridView.count(
          shrinkWrap: false,
          primary: false,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          children: list
              .map(
                (e) => BottomContainer(
                    image: e.image,
                    price: e.price,
                    name: e.name,
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => DetailPage(
                              image: e.image, name: e.name, price: e.price)));
                    }),
              )
              .toList()),
    );
  }
}
