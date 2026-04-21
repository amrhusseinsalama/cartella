import 'package:cartella/features/favorites/logic/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/theming/colors.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:cartella/core/widgets/product_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        title: Text(
          "Favorites",
          style: TextStyles.font11myBlack400W.copyWith(fontSize: 18.sp),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          final favoriteItems = context.read<FavoriteCubit>().favorites;
          if (favoriteItems.isNotEmpty) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: GridView.builder(
                itemCount: favoriteItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.55,
                  crossAxisSpacing: 5.w,
                  mainAxisSpacing: 5.h,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    title: favoriteItems[index].title,
                    price: favoriteItems[index].price.toString(),
                    imageUrl: favoriteItems[index].images[0],
                    icon: Icons.favorite,
                    iconColor: ColorsManager.mainRed,
                    onPressed: () {
                      context.read<FavoriteCubit>().toggleFavorite(
                        favoriteItems[index],
                      );
                    },
                    backgroundColor: ColorsManager.mywhite,
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 100.sp,
                    color: ColorsManager.mygray,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Your favorite list is empty!",
                    style: TextStyles.font11myBlack400W,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
