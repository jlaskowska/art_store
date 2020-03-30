// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShoppingCartScreenStore on _ShoppingCartScreenStore, Store {
  Computed<List<CartItem>> _$cartItemsComputed;

  @override
  List<CartItem> get cartItems =>
      (_$cartItemsComputed ??= Computed<List<CartItem>>(() => super.cartItems))
          .value;

  final _$_cartItemsAtom = Atom(name: '_ShoppingCartScreenStore._cartItems');

  @override
  List<CartItem> get _cartItems {
    _$_cartItemsAtom.context.enforceReadPolicy(_$_cartItemsAtom);
    _$_cartItemsAtom.reportObserved();
    return super._cartItems;
  }

  @override
  set _cartItems(List<CartItem> value) {
    _$_cartItemsAtom.context.conditionallyRunInAction(() {
      super._cartItems = value;
      _$_cartItemsAtom.reportChanged();
    }, _$_cartItemsAtom, name: '${_$_cartItemsAtom.name}_set');
  }

  final _$_ShoppingCartScreenStoreActionController =
      ActionController(name: '_ShoppingCartScreenStore');

  @override
  void addProductToCart(Product product) {
    final _$actionInfo =
        _$_ShoppingCartScreenStoreActionController.startAction();
    try {
      return super.addProductToCart(product);
    } finally {
      _$_ShoppingCartScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteProductFromCart(Product product) {
    final _$actionInfo =
        _$_ShoppingCartScreenStoreActionController.startAction();
    try {
      return super.deleteProductFromCart(product);
    } finally {
      _$_ShoppingCartScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void incrementProductQuantity(Product product) {
    final _$actionInfo =
        _$_ShoppingCartScreenStoreActionController.startAction();
    try {
      return super.incrementProductQuantity(product);
    } finally {
      _$_ShoppingCartScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementProductQuantity(Product product) {
    final _$actionInfo =
        _$_ShoppingCartScreenStoreActionController.startAction();
    try {
      return super.decrementProductQuantity(product);
    } finally {
      _$_ShoppingCartScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'cartItems: ${cartItems.toString()}';
    return '{$string}';
  }
}
