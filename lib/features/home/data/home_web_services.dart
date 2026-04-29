import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:cartella/core/networking/networking_constants.dart';
import 'package:cartella/features/home/data/product_model.dart';

part 'home_web_services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class HomeWebServices {
  factory HomeWebServices(Dio dio, {String baseUrl}) =
      _HomeWebServices;

  @GET("products")
  Future<List<ProductModel>> getProduct();
}
