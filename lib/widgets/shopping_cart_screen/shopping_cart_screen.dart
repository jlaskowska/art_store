import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/config/constants.dart';
import 'package:shopping_cart/localizations.dart';
import 'package:shopping_cart/widgets/common/shopping_cart_button.dart';
import 'package:shopping_cart/widgets/common/stepper_count.dart';
import 'package:shopping_cart/widgets/shopping_cart_screen/shopping_cart_screen_store.dart';
import 'dart:io' show Platform;

class ShoppingCartScreen extends StatelessWidget {
  static const double _indent = 32;

  const ShoppingCartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ShoppingCartScreenStore>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) => store.cartItems.isEmpty
              ? Center(
                  child: Text(AppLocalizations.shoppingCartScreenEmptyCartText),
                )
              : Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: store.cartItems.length,
                        itemBuilder: (context, index) => LayoutBuilder(
                          builder: (context, constraints) {
                            final cartItem = store.cartItems[index];
                            final product = cartItem.product;

                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Container(
                                    width: constraints.maxWidth * 0.3,
                                    height: constraints.maxWidth * 0.4,
                                    child: Image.asset(
                                      product.assetPath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: constraints.maxWidth * 0.05,
                                        right: constraints.maxWidth * 0.05,
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            product.name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(product.author),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Observer(
                                    builder: (_) => Column(
                                      children: <Widget>[
                                        Text(
                                          currencyFormatter.format(cartItem.subTotal),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        StepperCount(
                                          onIncrement: cartItem.incrementQuantity,
                                          onDecrement: cartItem.decrementQuantity,
                                          quantity: cartItem.quantity,
                                          width: constraints.maxWidth * 0.25,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Divider(
                      indent: _indent,
                      endIndent: _indent,
                      color: Colors.black45,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: _indent,
                        vertical: 16,
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  AppLocalizations.shoppingCartScreenTotal,
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                Observer(
                                  builder: (_) => Text(
                                    currencyFormatter.format(store.sumTotalPrice),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          LayoutBuilder(
                            builder: (_, constraints) => ShoppingCartButton(
                              width: constraints.maxWidth * 0.75,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Platform.isAndroid
                                          ? AlertDialog(
                                              title: Text(AppLocalizations.shoppingCartButtonCheckoutTitle),
                                              content: Text(AppLocalizations.shoppingCartButtonCheckoutContent),
                                              actions: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    store.clearShoppingCart();
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(AppLocalizations.shoppingCartButtonCheckoutOK),
                                                )
                                              ],
                                            )
                                          : CupertinoAlertDialog(
                                              title: Text(AppLocalizations.shoppingCartButtonCheckoutTitle),
                                              content: Text(AppLocalizations.shoppingCartButtonCheckoutContent),
                                              actions: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    store.clearShoppingCart();
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(AppLocalizations.shoppingCartButtonCheckoutOK),
                                                )
                                              ],
                                            );
                                    });
                              },
                              label: AppLocalizations.shoppingCartButtonCheckout.toUpperCase(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
