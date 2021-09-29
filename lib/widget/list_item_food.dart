import 'package:flutter/material.dart';
import 'package:navigation_example/model/food.dart';
import 'package:navigation_example/screen/food_detail_screen.dart';

class ListItemFood extends StatefulWidget {
  final List<Food> listFood;
  ListItemFood({Key? key, required this.listFood}) : super(key: key);
  @override
  _ListItemFoodState createState() => _ListItemFoodState();
}

class _ListItemFoodState extends State<ListItemFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) => ListTile(
          leading: CircleAvatar(
            radius: 50,
            child: FittedBox(
              child: Text('${widget.listFood[index].price}'),
            ),
          ),
          title: Text(widget.listFood[index].foodName),
          subtitle: Text('${widget.listFood[index].foodType}'),
          trailing: Icon(Icons.arrow_right_rounded, size: 50),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FoodDetailScreen(food: widget.listFood[index]),
              ),
            );
          },
        ),
        itemCount: widget.listFood.length,
      ),
    );
  }
}
