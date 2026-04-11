import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/theming/colors.dart';
import 'package:cartella/core/theming/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final bool? isObscureText;
  final String labelText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.isObscureText,
    this.suffixIcon,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 0.75.r,
              offset: Offset(0, 0.75),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: TextFormField(
            controller: controller,
            validator: validator,
            obscureText: isObscureText ?? false,
            style: TextStyles.font14LightBlack500W,
            decoration: InputDecoration(
              isDense: true,
              focusColor: ColorsManager.mywhite,
              fillColor: ColorsManager.mywhite,
              hoverColor: ColorsManager.mywhite,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              filled: true,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              labelText: labelText,
              labelStyle: TextStyles.font14gray500W,
              floatingLabelStyle: TextStyles.font11Graye600W,
              border: OutlineInputBorder(borderSide: BorderSide.none),
              suffixIcon: suffixIcon,
            ),
          ),
        ),
      ),
    );
  }
}
