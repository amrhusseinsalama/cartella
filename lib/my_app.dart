import 'package:cartella/core/routing/app_router.dart';
import 'package:cartella/core/routing/routes.dart';
import 'package:cartella/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatefulWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: ColorsManager.mainRed,
          scaffoldBackgroundColor: ColorsManager.whiteBackground,
          appBarTheme: AppBarTheme(
            backgroundColor: ColorsManager.whiteBackground,
            surfaceTintColor: ColorsManager.whiteBackground,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.onBoardingScreen,
        onGenerateRoute: widget.appRouter.generateRoute,
      ),
    );
  }
}
