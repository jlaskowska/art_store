import 'package:meta/meta.dart';
import 'package:mobx/mobx.dart';
import 'package:shopping_cart/models/product.dart';

part 'shopping_cart_screen_store.g.dart';

class ShoppingCartScreenStore = _ShoppingCartScreenStore with _$ShoppingCartScreenStore;

abstract class _ShoppingCartScreenStore with Store {
  @observable
  List<CartItem> _cartItems = [];

  @computed
  List<CartItem> get cartItems => _cartItems;

  @action
  void addProductToCart(Product product) {
    final item = _cartItemWithProduct(product);
    if (item == null) {
      _cartItems.add(
        CartItem(product: product),
      );
    } else {
      item.quantity++;
    }
  }

  // int quantityForProduct(Product product) => _cartItemWithProduct(product)?.quantity;
  // @observable
  // Map<int, int> quantities = {};

  @action
  void deleteProductFromCart(Product product) => _cartItems.removeWhere((item) => item.product.id == product.id);

  @action
  void incrementProductQuantity(Product product) {
    final item = _cartItemWithProduct(product);
    item?.quantity++;
    // d();
  }

  @action
  void decrementProductQuantity(Product product) {
    final item = _cartItemWithProduct(product);
    item?.quantity--;
    // d();
  }

  // @action
  // void d() {
  //   quantities = {};
  //   for (CartItem item in _cartItems) {
  //     quantities[item.product.id] = item.quantity;
  //   }
  // }

  CartItem _cartItemWithProduct(Product product) => _cartItems.firstWhere(
        (item) => item.product.id == product.id,
        orElse: () => null,
      );
}

class CartItem {
  final Product product;
  int quantity = 1;

  CartItem({
    @required this.product,
  });
}
