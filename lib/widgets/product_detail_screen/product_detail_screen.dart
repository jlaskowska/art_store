import 'package:flutter/material.dart';
import 'package:shopping_cart/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: <Widget>[
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                  ),
                  child: Image.asset(
                    product.assetPath,
                    fit: BoxFit.cover,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
