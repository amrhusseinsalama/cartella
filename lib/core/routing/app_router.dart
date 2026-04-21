import 'package:cartella/core/constants/auth_constants.dart';
import 'package:cartella/features/auth/logic/cubit/auth_cubit.dart';
import 'package:cartella/features/favorites/logic/cubit/favorite_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cartella/app_bottom_nav_bar.dart';
import 'package:cartella/core/di/injection.dart';
import 'package:cartella/core/routing/routes.dart';
import 'package:cartella/features/auth/ui/auth_screen.dart';
import 'package:cartella/features/home/logic/cubit/product_cubit.dart';
import 'package:cartella/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.authScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: AuthScreen(type: AuthType.signup),
          ),
        );
      case Routes.appBottomNavBar:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<ProductCubit>()..emitGetProducts(),
              ),
              BlocProvider.value(value: getIt<FavoriteCubit>()),
            ],
            child: AppBottomNavBar(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No Route Defined for ${settings.name}")),
          ),
        );
    }
  }
}
