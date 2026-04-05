import 'package:cartella/features/home/logic/entities/product.dart';

abstract class ProductRepo {
  Future<List<Product>> getProducts();
}
