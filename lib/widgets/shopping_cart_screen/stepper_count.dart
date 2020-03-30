import 'package:flutter/material.dart';
import 'package:shopping_cart/config/app_colors.dart';

class StepperCount extends StatelessWidget {
  final int quantity;
  final double width;
  final void Function() decrement;
  final void Function() increment;

  StepperCount({
    Key key,
    @required this.quantity,
    this.width = 75,
    @required this.decrement,
    @required this.increment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.remove,
                  size: 16,
                ),
                onPressed: decrement,
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.orange,
                ),
                child: Center(
                  child: Text(
                    quantity.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.add,
                  size: 16,
                ),
                onPressed: increment,
              ),
            ],
          ),
        ));
  }
}
