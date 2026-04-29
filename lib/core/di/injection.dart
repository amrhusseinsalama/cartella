import 'package:cartella/features/auth/data/auth_repo.dart';
import 'package:cartella/features/auth/data/auth_repo_impl.dart';
import 'package:cartella/features/auth/logic/cubit/auth_cubit.dart';
import 'package:cartella/features/cart/logic/cubit/cart_cubit.dart';
import 'package:cartella/features/categories/data/category_web_services.dart';
import 'package:cartella/features/categories/logic/cubit/category_cubit.dart';
import 'package:cartella/features/categories/logic/repositoy.dart';
import 'package:cartella/features/favorites/logic/cubit/favorite_cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:cartella/features/home/data/repo_impl.dart';
import 'package:cartella/features/home/data/home_web_services.dart';
import 'package:cartella/features/home/logic/cubit/home_cubit.dart';
import 'package:cartella/features/home/logic/repo/product_repo.dart';

final getIt = GetIt.instance;

void initGetIt() {
  //Home
  getIt.registerFactory<HomeWebServices>(() => HomeWebServices(Dio()));
  getIt.registerFactory<ProductRepo>(() => RepoImpl(getIt()));
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt()));

  //Fav
  getIt.registerLazySingleton<FavoriteCubit>(() => FavoriteCubit());

  //cart
  getIt.registerLazySingleton<CartCubit>(() => CartCubit());

  //Categories
  getIt.registerFactory<CategoryWebServices>(() => CategoryWebServices(Dio()));
  getIt.registerFactory<CategoryRepo>(() => CategoryRepo(getIt()));
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));

  //Auth
  getIt.registerFactory<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerFactory<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
}
