import 'package:cartella/features/auth/data/auth_repo.dart';
import 'package:cartella/features/auth/data/auth_repo_impl.dart';
import 'package:cartella/features/auth/logic/cubit/auth_cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:cartella/features/home/data/repo_impl.dart';
import 'package:cartella/features/home/data/web_services.dart';
import 'package:cartella/features/home/logic/cubit/product_cubit.dart';
import 'package:cartella/features/home/logic/repo/product_repo.dart';

final getIt = GetIt.instance;

void initGetIt() {
  //Home
  getIt.registerLazySingleton<WebServices>(() => WebServices(Dio()));
  getIt.registerLazySingleton<ProductRepo>(() => RepoImpl(getIt()));
  getIt.registerFactory<ProductCubit>(() => ProductCubit(getIt()));

  //Auth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
}
