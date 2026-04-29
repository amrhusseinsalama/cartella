import 'package:cartella/core/networking/networking_constants.dart';
import 'package:cartella/features/categories/data/category_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'category_web_services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class CategoryWebServices {
  factory CategoryWebServices(Dio dio, {String baseUrl}) =
      _CategoryWebServices;

  @GET("categories")
  Future<List<CategoryModel>> getCategories();
}