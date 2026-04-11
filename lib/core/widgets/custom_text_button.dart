import 'package:cartella/core/theming/colors.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  const CustomTextButton({
    super.key,
    this.width,
    this.height,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width ?? double.infinity.w,
      height:height ?? 50.h,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: ColorsManager.mainRed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.r),
          ),
        ),
        child: Text(buttonText, style: TextStyles.font14White500W),
      ),
    );
  }
}
