import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart/localizations.dart';
import 'package:shopping_cart/models/product.dart';
import 'package:shopping_cart/widgets/common/app_bar_title.dart';
import 'package:shopping_cart/widgets/product_detail_screen/star_rating.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite_border,
            ),
            onPressed: () {
              print('Added to favourites');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Hero(
                  tag: product.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                    ),
                    child: Image.asset(
                      product.assetPath,
                      fit: BoxFit.cover,
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * 0.6,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16),
                child: StarRating(productRating: product.rating),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 8),
                    child: AutoSizeText(
                      product.name,
                      minFontSize: 20,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, top: 8),
                    child: AutoSizeText(
                      '${product.price.toStringAsFixed(2)}' + ' €',
                      minFontSize: 18,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 8),
                child: AutoSizeText(
                  product.author,
                  minFontSize: 12,
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: constraints.maxWidth * 0.75,
                    child: ButtonTheme(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: RaisedButton(
                          elevation: 0,
                          color: Colors.black,
                          child: Text(
                            AppLocalizations.productDetailScreenAddToBasketButton.toUpperCase(),
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            print('Added to cart');
                          },
                        ),
                      ),
                    ),
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
