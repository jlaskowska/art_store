import 'package:shopping_cart/models/product.dart';

abstract class IDatabaseService {
  Future<void> initialize();
  Future<List<Product>> getAllProducts();
  Future<List<Product>> getFavouriteProducts();
  Future<void> toggleIsFavourite(Product product);
}
