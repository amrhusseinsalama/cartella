import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:cartella/features/home/data/repo_impl.dart';
import 'package:cartella/features/home/data/web_services.dart';
import 'package:cartella/features/home/logic/cubit/product_cubit.dart';
import 'package:cartella/features/home/logic/repo/product_repo.dart';

final getIt = GetIt.instance;

void initGetIt(){
  getIt.registerLazySingleton<WebServices>(() => WebServices(Dio()));
  getIt.registerLazySingleton<ProductRepo>(() => RepoImpl(getIt()));
  getIt.registerLazySingleton<ProductCubit>(() => ProductCubit(getIt()));
}