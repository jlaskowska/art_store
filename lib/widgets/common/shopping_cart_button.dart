import 'package:flutter/material.dart';

class ShoppingCartButton extends StatelessWidget {
  final double width;
  final Function onPressed;
  final String label;

  const ShoppingCartButton({
    Key key,
    @required this.width,
    @required this.onPressed,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ButtonTheme(
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: RaisedButton(
            elevation: 0,
            color: Colors.black,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
