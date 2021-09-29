import 'package:flutter/material.dart';
import 'package:navigation_example/model/food.dart';

class AddFoodScreen extends StatefulWidget {
  const AddFoodScreen(
      {Key? key,
      this.addFood,
      this.listFood,
      required this.isEdit,
      this.food,
      this.index})
      : super(key: key);

  final Function? addFood;
  final List<Food>? listFood;
  final bool isEdit;
  final Food? food;
  final int? index;

  @override
  _AddFoodScreenState createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  final _formKey = GlobalKey<FormState>();
  final _foodName = TextEditingController();
  final _foodType = TextEditingController();
  final _foodPrice = TextEditingController();
  final _foodDescription = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit) {
      _foodName.text = widget.food?.foodName ?? "";
      _foodType.text = widget.food?.foodType ?? "";
      _foodPrice.text = widget.food?.price ?? "";
      _foodDescription.text = widget.food?.description ?? "";
    }
  }

  _actionEditAdd() {
    if (widget.isEdit) {
      widget.listFood![widget.index!] = Food(_foodName.text, _foodType.text,
          _foodPrice.text, _foodDescription.text);
    } else {
      widget.addFood!(_foodName.text, _foodType.text, _foodPrice.text,
          _foodDescription.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Food"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _foodName,
                    decoration: new InputDecoration(
                      hintText: 'e.g: Nikku',
                      labelText: 'Food',
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Food can not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: _foodType,
                    decoration: new InputDecoration(
                      hintText: 'e.g: Maincourse',
                      labelText: 'Type',
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Category can not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _foodPrice,
                    decoration: new InputDecoration(
                      hintText: 'e.g: 2',
                      labelText: 'Price',
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Category can not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    minLines: 6,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: _foodDescription,
                    decoration: new InputDecoration(
                      hintText: 'Some description about food..',
                      labelText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Category can not be empty';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _actionEditAdd();
                          Navigator.pop(context);
                        }
                      },
                      child: Text('Food Form')),
                ],
              ),
            )),
      ),
    );
  }
}
