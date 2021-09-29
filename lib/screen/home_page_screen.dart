import 'package:flutter/material.dart';
import 'package:navigation_example/model/food.dart';
import 'package:navigation_example/screen/add_food_screen.dart';
import 'package:navigation_example/widget/list_item_food.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<Food> listFood = [];

  void _addFood(
      String foodName, String foodType, String price, String description) {
    setState(() {
      listFood.add(Food(foodName, foodType, price, description));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListItemFood(listFood: listFood),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddFoodScreen(
                addFood: _addFood,
              ),
            ),
          );
        },
        tooltip: 'Add Food',
        child: Icon(Icons.add),
      ),
    );
  }
}
