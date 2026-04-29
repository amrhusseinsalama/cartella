import 'package:cartella/features/categories/data/category_model.dart';
import 'package:cartella/features/categories/data/category_web_services.dart';

class CategoryRepo{
  final CategoryWebServices categoryWebServices;
  CategoryRepo(this.categoryWebServices);

  Future<List<CategoryModel>> getProduct() async{
    return await categoryWebServices.getCategories();
  }
}