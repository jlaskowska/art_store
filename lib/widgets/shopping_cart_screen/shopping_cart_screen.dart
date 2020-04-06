import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/config/constants.dart';
import 'package:shopping_cart/localizations.dart';
import 'package:shopping_cart/widgets/shopping_cart_screen/shopping_cart_screen_store.dart';
import 'package:shopping_cart/widgets/shopping_cart_screen/stepper_count.dart';

class ShoppingCartScreen extends StatelessWidget {
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
              : ListView.builder(
                  itemCount: store.cartItems.length,
                  itemBuilder: (context, index) => LayoutBuilder(
                    builder: (context, constraints) {
                      final cartItem = store.cartItems[index];
                      final product = cartItem.product;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: constraints.maxWidth * 0.3,
                              height: constraints.maxWidth * 0.4,
                              child: Image.asset(
                                product.assetPath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
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
                            Observer(
                              builder: (_) => Column(
                                children: <Widget>[
                                  Text(
                                    currencyFormatter.format(product.price * cartItem.quantity),
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
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
          //   child: ListTile(
          //     leading: Image.asset(
          //       store.cartItems[index].product.assetPath,
          //       fit: BoxFit.cover,
          //     ),
          //     title: Text(store.cartItems[index].product.name),
          //     subtitle: Text(store.cartItems[index].product.author),
          //     trailing: Text(
          //       store.cartItems[index].product.price.toStringAsFixed(2),
          //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          //     ),
          //   ),
          // ),
          // ),
        ),
      ),
    );
  }
}
