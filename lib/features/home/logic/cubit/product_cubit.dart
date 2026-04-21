import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cartella/features/home/logic/entities/product.dart';
import 'package:cartella/features/home/logic/repo/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepo productRepo;
  ProductCubit(this.productRepo) : super(ProductInitial());

  void emitGetProducts() async {
    try {
      final products = await productRepo.getProducts();
      emit(GetProducts(products));
    } catch (e) {
      emit(ProductErorr(e.toString()));
    }
  }
}
