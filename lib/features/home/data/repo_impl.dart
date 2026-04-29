import 'package:cartella/features/home/data/home_web_services.dart';
import 'package:cartella/features/home/logic/entities/product.dart';
import 'package:cartella/features/home/logic/repo/product_repo.dart';

class RepoImpl implements ProductRepo {
  final HomeWebServices webServices;
  RepoImpl(this.webServices);

  @override
  Future<List<Product>> getProducts() async {
    return await webServices.getProduct();
  }
}
