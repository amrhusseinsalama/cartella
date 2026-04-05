import 'package:cartella/features/home/data/web_services.dart';
import 'package:cartella/features/home/logic/entities/product.dart';
import 'package:cartella/features/home/logic/repo/product_repo.dart';

class RepoImpl implements ProductRepo {
  final WebServices webServices;
  RepoImpl(this.webServices);

  @override
  Future<List<Product>> getProducts() async {
    return await webServices.getProduct();
  }
}
