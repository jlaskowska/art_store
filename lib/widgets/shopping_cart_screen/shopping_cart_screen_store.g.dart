// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ShoppingCartScreenStore on _ShoppingCartScreenStore, Store {
  Computed<double> _$sumTotalPriceComputed;

  @override
  double get sumTotalPrice =>
      (_$sumTotalPriceComputed ??= Computed<double>(() => super.sumTotalPrice))
          .value;

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
  void _removeCartItem(CartItem cartItem) {
    final _$actionInfo =
        _$_ShoppingCartScreenStoreActionController.startAction();
    try {
      return super._removeCartItem(cartItem);
    } finally {
      _$_ShoppingCartScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'sumTotalPrice: ${sumTotalPrice.toString()}';
    return '{$string}';
  }
}

mixin _$CartItem on _CartItem, Store {
  Computed<int> _$quantityComputed;

  @override
  int get quantity =>
      (_$quantityComputed ??= Computed<int>(() => super.quantity)).value;
  Computed<double> _$subTotalComputed;

  @override
  double get subTotal =>
      (_$subTotalComputed ??= Computed<double>(() => super.subTotal)).value;

  final _$_quantityAtom = Atom(name: '_CartItem._quantity');

  @override
  int get _quantity {
    _$_quantityAtom.context.enforceReadPolicy(_$_quantityAtom);
    _$_quantityAtom.reportObserved();
    return super._quantity;
  }

  @override
  set _quantity(int value) {
    _$_quantityAtom.context.conditionallyRunInAction(() {
      super._quantity = value;
      _$_quantityAtom.reportChanged();
    }, _$_quantityAtom, name: '${_$_quantityAtom.name}_set');
  }

  final _$_CartItemActionController = ActionController(name: '_CartItem');

  @override
  void incrementQuantity() {
    final _$actionInfo = _$_CartItemActionController.startAction();
    try {
      return super.incrementQuantity();
    } finally {
      _$_CartItemActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementQuantity() {
    final _$actionInfo = _$_CartItemActionController.startAction();
    try {
      return super.decrementQuantity();
    } finally {
      _$_CartItemActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'quantity: ${quantity.toString()},subTotal: ${subTotal.toString()}';
    return '{$string}';
  }
}
