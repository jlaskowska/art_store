import 'package:flutter/material.dart';
import 'package:shopping_cart/config/app_colors.dart';

class StarRating extends StatelessWidget {
  final double productRating;
  const StarRating({Key key, @required this.productRating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => Icon(
          index < productRating ? Icons.star : Icons.star_border,
          color: AppColors.orange,
        ),
      ),
    );
  }
}
