import 'package:flutter/material.dart';
import 'package:navigation_example/model/food.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({Key? key, required this.food}) : super(key: key);

  final Food food;
  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Food Detail"),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 16),
              Text("Food Name", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('${widget.food.foodName}'),
              SizedBox(height: 16),
              Text("Food Type", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('${widget.food.foodType}'),
              SizedBox(height: 16),
              Text("Food Price", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text("\$" + widget.food.price),
              SizedBox(height: 16),
              Text("Food Description",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('${widget.food.description}'),
            ],
          ),
        ));
  }
}
