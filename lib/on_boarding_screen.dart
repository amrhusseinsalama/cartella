import 'package:cartella/core/helper/extensions.dart';
import 'package:cartella/core/routing/routes.dart';
import 'package:cartella/core/widgets/custom_text_button.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity.w,
            height: double.infinity.h,
            child: Image.asset(
              "assets/images/onboarding.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cartella", style: TextStyles.font50WhiteBold),
                    Text(
                      "Your fashion journey starts here\nLook good. Feel confident. Shop smart",
                      style: TextStyles.font14White500W,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 30.h,
                  left: 0.w,
                  right: 0.w,
                  child: CustomTextButton(
                    buttonText: "Get Started",
                    onPressed: () => context.pushReplacementNamed(
                      Routes.authScreen,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
