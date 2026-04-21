import 'package:cartella/features/favorites/logic/cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/theming/colors.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:cartella/core/widgets/product_card.dart';
import 'package:cartella/features/home/logic/cubit/product_cubit.dart';
import 'package:cartella/features/home/ui/widgets/sliver_text_row.dart';
import 'package:cartella/features/home/ui/widgets/sliver_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          buildSliverText("New\n", "You’ve never seen it before!"),
          buildHorizentalListView(),
          buildSliverText("Sale\n", "Super summer sale"),
          buildHorizentalListView(),
          buildSmallBanner(),
          buildSliverText("Catetegories", ""),
          buildHorizentalListView(),
        ],
      ),
    );
  }
}

Widget buildHorizentalListView() {
  return SliverToBoxAdapter(
    child: SizedBox(
      height: 440.h,
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, homeState) {
          if (homeState is GetProducts) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemCount: homeState.getProducts.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, favoriteState) {
                    final currentProduct = homeState.getProducts[index];
                    final favoriteCubit = context.read<FavoriteCubit>();
                    final isFav = favoriteCubit.isFavorite(currentProduct);
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: ProductCard(
                          title: currentProduct.title,
                          price: currentProduct.price.toString(),
                          imageUrl: currentProduct.images[0],
                          icon: isFav ? Icons.favorite : Icons.favorite_outline,
                          iconColor: isFav
                              ? ColorsManager.mainRed
                              : ColorsManager.mygray,
                          onPressed: () {
                            favoriteCubit.toggleFavorite(currentProduct);
                          },
                          backgroundColor: ColorsManager.mywhite,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    ),
  );
}

Widget buildSmallBanner() {
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Stack(
        children: [
          Card(
            elevation: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.asset(
                "assets/images/small_banner.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 10.h,
            left: 10.w,
            right: 0,
            child: Text(
              "Street clothing",
              style: TextStyles.font50WhiteBold.copyWith(fontSize: 30.sp),
            ),
          ),
        ],
      ),
    ),
  );
}
