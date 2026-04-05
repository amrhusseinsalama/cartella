import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:cartella/core/networking/networking_constants.dart';
import 'package:cartella/features/home/data/product_model.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) =
      _WebServices;

  @GET("products")
  Future<List<ProductModel>> getProduct();
}
