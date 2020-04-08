import 'package:art_store/models/product.dart';

abstract class IDatabaseService {
  Future<void> initialize();
  Future<List<Product>> getAllProducts();
}
