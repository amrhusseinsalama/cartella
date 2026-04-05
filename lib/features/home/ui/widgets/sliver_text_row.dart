import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/theming/styles.dart';

Widget buildSliverText(String text1, String text2) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: text1, style: TextStyles.font34myBlack700W),
                TextSpan(
                  text: text2,
                  style: TextStyles.font11Graye600W.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          InkWell(child: Text("View all", style: TextStyles.font11myBlack400W)),
        ],
      ),
    ),
  );
}