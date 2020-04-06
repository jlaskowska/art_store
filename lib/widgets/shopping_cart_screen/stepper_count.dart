import 'package:flutter/material.dart';
import 'package:shopping_cart/config/app_colors.dart';

class StepperCount extends StatelessWidget {
  final int quantity;
  final double width;
  final void Function() onDecrement;
  final void Function() onIncrement;

  StepperCount({
    Key key,
    @required this.quantity,
    this.width = 75,
    @required this.onDecrement,
    @required this.onIncrement,
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
                onPressed: onDecrement,
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
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.add,
                  size: 16,
                ),
                onPressed: onIncrement,
              ),
            ],
          ),
        ));
  }
}
