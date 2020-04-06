import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
import 'package:shopping_cart/models/product.dart';

part 'shopping_cart_screen_store.g.dart';

class ShoppingCartScreenStore = _ShoppingCartScreenStore with _$ShoppingCartScreenStore;

abstract class _ShoppingCartScreenStore with Store {
  final ObservableList<CartItem> _cartItems = ObservableList<CartItem>();

  ObservableList<CartItem> get cartItems => _cartItems;

  @action
  void addProductToCart(Product product) {
    final item = _cartItemWithProduct(product);
    if (item == null) {
      _cartItems.add(
        CartItem(
          product: product,
          onRemoveItem: _removeCartItem,
        ),
      );
    } else {
      item.incrementQuantity();
    }
  }

  @action
  void deleteProductFromCart(Product product) => _cartItems.removeWhere((item) => item.product.id == product.id);

  @action
  void _removeCartItem(CartItem cartItem) => _cartItems.remove(cartItem);

  CartItem _cartItemWithProduct(Product product) => _cartItems.firstWhere(
        (item) => item.product.id == product.id,
        orElse: () => null,
      );
}

class CartItem = _CartItem with _$CartItem;

abstract class _CartItem with Store {
  final Product product;
  final void Function(CartItem) onRemoveItem;

  _CartItem({
    @required this.product,
    @required this.onRemoveItem,
  });

  @observable
  int _quantity = 1;

  @computed
  int get quantity => _quantity;

  @action
  void incrementQuantity() => _quantity++;

  @action
  void decrementQuantity() {
    _quantity--;

    if (quantity <= 0) {
      onRemoveItem(this);
    }
  }
}
