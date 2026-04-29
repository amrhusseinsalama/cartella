import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/helper/spacing.dart';
import 'package:cartella/core/theming/colors.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:cartella/core/widgets/circle_action_button.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.icon,
    required this.iconColor,
    this.backgroundColor,
    required this.onPressed,
    this.onTap,
    required this.imageUrl,
    required this.title,
    required this.price,
  });

  final IconData icon;
  final Color iconColor;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final VoidCallback? onTap;
  final String imageUrl;
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: ColorsManager.mywhite,
        elevation: 2,
        child: SizedBox(
          width: 220.w,
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    height: 220.h,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(child: CircularProgressIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/product.png',
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0.w,
                    bottom: -25.h,
                    child: CircleActionButton(
                      icon: icon,
                      iconColor: iconColor,
                      onPressed: onPressed,
                      backgroundColor: backgroundColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 5.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                            5,
                            (index) => const Icon(
                              Icons.star,
                              color: ColorsManager.myYellow,
                              size: 18,
                            ),
                          ),
                        ),
                        horizentalSpacing(6),
                        const Text(
                          "(10)",
                          style: TextStyle(color: ColorsManager.mygray),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "$title \n",
                              style: TextStyles.font11myBlack400W.copyWith(
                                fontSize: 16.sp,
                              ),
                            ),
                            TextSpan(
                              text: "Color: ",
                              style: TextStyles.font11Graye600W.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(text: "Blue"),
                            WidgetSpan(child: horizentalSpacing(40)),
                            TextSpan(
                              text: "Size: ",
                              style: TextStyles.font11Graye600W.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(text: "L\n"),
                            TextSpan(text: "Price: $price \$"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
