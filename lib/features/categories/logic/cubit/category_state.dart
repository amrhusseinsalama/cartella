part of 'category_cubit.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class GetCategories extends CategoryState {
  final List<CategoryModel> categories;
  const GetCategories(this.categories);
}

final class CategoryErorr extends CategoryState {
  final String message;
  const CategoryErorr(this.message);
}
