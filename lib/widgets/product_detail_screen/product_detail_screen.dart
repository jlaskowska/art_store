import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:art_store/config/constants.dart';
import 'package:art_store/localizations.dart';
import 'package:art_store/models/product.dart';
import 'package:art_store/widgets/common/app_bar_title.dart';
import 'package:art_store/widgets/common/shopping_cart_button.dart';
import 'package:art_store/widgets/common/stepper_count.dart';
import 'package:art_store/widgets/product_detail_screen/star_rating.dart';
import 'package:art_store/widgets/product_detail_screen/animated_star_rating.dart';
import 'package:art_store/widgets/shopping_cart_screen/shopping_cart_screen_store.dart';

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
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                  ),
                  child: Hero(
                    tag: product.id,
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
                child: _Stars(
                  rating: product.rating,
                ),
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
                      currencyFormatter.format(product.price),
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
                  child: _BottomBar(
                    product: product,
                    width: constraints.maxWidth * 0.75,
                    store: Provider.of<ShoppingCartScreenStore>(context, listen: false),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final Product product;
  final double width;
  final ShoppingCartScreenStore store;

  const _BottomBar({
    @required this.product,
    @required this.width,
    @required this.store,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => !store.isProductInCart(product)
          ? ShoppingCartButton(
              label: AppLocalizations.productDetailScreenAddToBasketButton.toUpperCase(),
              width: width,
              onPressed: () => store.addProductToCart(product),
            )
          : StepperCount(
              width: width,
              quantity: store.cartItemWithProduct(product).quantity,
              onIncrement: store.cartItemWithProduct(product).incrementQuantity,
              onDecrement: store.cartItemWithProduct(product).decrementQuantity,
            ),
    );
  }
}

class _Stars extends StatefulWidget {
  final double rating;

  _Stars({Key key, @required this.rating}) : super(key: key);

  @override
  __StarsState createState() => __StarsState();
}

class __StarsState extends State<_Stars> {
  bool _isDelayDone = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 600)).then((_) => setState(() => _isDelayDone = true));
  }

  @override
  Widget build(BuildContext context) {
    return _isDelayDone ? AnimatedStarRating(prodcutRating: widget.rating) : StarRating(productRating: 0);
  }
}
