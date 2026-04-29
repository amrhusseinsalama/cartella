import 'package:cartella/features/categories/data/category_model.dart';
import 'package:cartella/features/categories/logic/repositoy.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepo categoryRepo;
  CategoryCubit(this.categoryRepo) : super(CategoryInitial());

  void emitGetCategories() async {
    try {
      final categories = await categoryRepo.getProduct();
      emit(GetCategories(categories));
    } catch (e) {
      emit(CategoryErorr(e.toString()));
    }
  }
}
