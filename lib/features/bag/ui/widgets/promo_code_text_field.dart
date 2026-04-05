import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/theming/colors.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:cartella/core/widgets/circle_action_button.dart';

class PromoCodeTextField extends StatelessWidget {
  const PromoCodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: TextField(
                decoration: InputDecoration(
                  suffixIcon: CircleActionButton(
                    icon: Icons.arrow_forward,
                    iconColor: ColorsManager.mywhite,
                    onPressed: () {},
                    backgroundColor: ColorsManager.myblack,
                  ),
                  fillColor: ColorsManager.mywhite,
                  isDense: true,
                  filled: true,
                  hintText: "Enter your promo code",
                  hintStyle: TextStyles.font14gray500W,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
    );
  }
}