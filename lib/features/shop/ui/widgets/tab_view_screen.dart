import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/helper/spacing.dart';
import 'package:cartella/core/theming/colors.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:cartella/core/widgets/custom_tile_container.dart';

class TabViewScreen extends StatelessWidget {
  const TabViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CustomTileContainer(color: ColorsManager.mainRed),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                children: [
                  TextSpan(
                    text: "SUMMER SALES\n",
                    style: TextStyles.font50WhiteBold.copyWith(fontSize: 25),
                  ),
                  TextSpan(
                    text: "Up to 50% off",
                    style: TextStyles.font14White500W,
                  ),
                ],
              ),
            ),
          ],
        ),
        verticalSpacing(20),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: CustomTileContainer(
                color: ColorsManager.mywhite,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          titles[index],
                          style: TextStyle(
                            color: ColorsManager.myblack,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox.expand(
                        child: Image.asset(
                          "assets/images/category.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

List<String> titles = ["New", "Clothes", "Shoes", "Accesories"];
