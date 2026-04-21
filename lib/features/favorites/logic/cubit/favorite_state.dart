part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}
final class FavoriteUpdated extends FavoriteState {
  final List<Product> favorites;
  FavoriteUpdated(this.favorites);
}
