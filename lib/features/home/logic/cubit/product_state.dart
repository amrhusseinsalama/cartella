part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetProducts extends ProductState {
  final List<Product> getProducts;

  GetProducts(this.getProducts);
}

final class ProductErorr extends ProductState {
  final String message;
  ProductErorr(this.message);
}
