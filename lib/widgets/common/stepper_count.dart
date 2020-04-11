import 'package:flutter/material.dart';
import 'package:art_store/config/app_colors.dart';

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
              icon: const Icon(
                Icons.remove,
                size: 16,
              ),
              onPressed: onDecrement,
            ),
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.orange,
              ),
              child: Center(
                child: Text(
                  quantity.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            IconButton(
              padding: const EdgeInsets.all(0),
              icon: const Icon(
                Icons.add,
                size: 16,
              ),
              onPressed: onIncrement,
            ),
          ],
        ),
      ),
    );
  }
}
