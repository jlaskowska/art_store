import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_cart/enums/category.dart';
import 'package:shopping_cart/models/product.dart';

main() {
  test('fomJson', () {
    final jsonMap = {
      'id': 1,
      'name': 'Now or Never',
      'author': 'Daria Shevtsova',
      'category': 0,
      'price': 199.99,
      'isFavourite': 0,
      'rating': 3,
    };
    final product = Product.fromJson(jsonMap);
    expect(product.id, 1);
    expect(product.name, 'Now or Never');
    expect(product.author, 'Daria Shevtsova');
    expect(product.category, Category.pop);
    expect(product.price, 199.99);
    expect(product.rating, 3);
  });

  test('fomJson', () {
    final jsonMap = {
      'id': 1,
      'name': 'Now or Never',
      'author': 'Daria Shevtsova',
      'category': 0,
      'price': 199.99,
      'isFavourite': 0,
      'rating': 3,
    };
    final product = Product(
      id: 1,
      name: 'Now or Never',
      author: 'Daria Shevtsova',
      category: Category.pop,
      price: 199.99,
      rating: 3,
    );
    final convertedJsonMap = product.toJson();
    expect(convertedJsonMap, jsonMap);
  });
}
