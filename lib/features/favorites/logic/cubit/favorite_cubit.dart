import 'package:cartella/features/home/logic/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final List<Product> _favoriteItems = [];
  FavoriteCubit() : super(FavoriteInitial());

  List<Product> get favorites => _favoriteItems;

  void toggleFavorite(Product product) {
    if (_favoriteItems.contains(product)) {
      _favoriteItems.remove(product);
    } else {
      _favoriteItems.add(product);
    }
    emit(FavoriteUpdated(List.from(_favoriteItems)));
  }

  bool isFavorite(Product product) {
    return _favoriteItems.contains(product);
  }
}
