import 'package:cartella/core/di/injection.dart';
import 'package:cartella/core/routing/app_router.dart';
import 'package:cartella/core/theming/colors.dart';
import 'package:cartella/features/cart/logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final String initialRoute;
  const MyApp({super.key, required this.appRouter, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => getIt<CartCubit>(),
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: ColorsManager.mainRed,
            scaffoldBackgroundColor: ColorsManager.whiteBackground,
            appBarTheme: AppBarTheme(
              backgroundColor: ColorsManager.whiteBackground,
              surfaceTintColor: ColorsManager.whiteBackground,
              elevation: 0,
            ),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: initialRoute,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}
