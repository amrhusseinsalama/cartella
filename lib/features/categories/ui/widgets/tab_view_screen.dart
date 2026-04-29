import 'package:cartella/features/categories/logic/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is GetCategories) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.categories.length,
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
                                overflow: TextOverflow.ellipsis,
                                state.categories[index].name,
                                style: TextStyles.font14Black500W
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.r),
                              child: Image.network(
                                state.categories[index].image,
                                fit: BoxFit.cover,
                                loadingBuilder:
                                    (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                errorBuilder: (context, error, stackTrace) {
                                  return Center(
                                    child: Text("Picture Not Found !!!!"),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}

List<String> titles = ["New", "Clothes", "Shoes", "Accesories"];
