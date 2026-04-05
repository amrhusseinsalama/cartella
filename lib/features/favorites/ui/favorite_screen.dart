import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/theming/colors.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:cartella/core/widgets/product_card.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: GridView.builder(
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.55,
            crossAxisSpacing: 5.w,
            mainAxisSpacing: 5.h,
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              title: "Shirt",
              price: "10",
              imageUrl: "assets/images/product.png",
              icon: Icons.shopping_bag,
              iconColor: ColorsManager.mywhite,
              onPressed: () {},
              backgroundColor: ColorsManager.mainRed,
            );
          },
        ),
      ),
    );
  }
}
