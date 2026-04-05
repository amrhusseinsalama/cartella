import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:cartella/core/widgets/custom_text_button.dart';

Widget buildSliverAppBar() {
  return SliverAppBar(
    stretch: true,
    expandedHeight: 500.h,
    flexibleSpace: FlexibleSpaceBar(
      background: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/big_banner.png", fit: BoxFit.cover),
          Positioned(
            left: 20.w,
            bottom: 20.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Fashion\nsale", style: TextStyles.font50WhiteBold),
                CustomTextButton(
                  buttonText: "Check",
                  onPressed: () {},
                  width: 160.w,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}