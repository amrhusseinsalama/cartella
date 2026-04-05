import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/helper/spacing.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:cartella/core/widgets/custom_text_button.dart';
import 'package:cartella/features/bag/ui/widgets/bag_item.dart';
import 'package:cartella/features/bag/ui/widgets/promo_code_text_field.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({super.key});

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("My Bag", style: TextStyles.font34myBlack700W),
            verticalSpacing(10),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return BagItem();
                },
              ),
            ),
            PromoCodeTextField(),
            verticalSpacing(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total amount:", style: TextStyles.font14gray500W),
                Text(
                  "124\$",
                  style: TextStyles.font14Black500W.copyWith(fontSize: 17),
                ),
              ],
            ),
            verticalSpacing(15),
            CustomTextButton(buttonText: "CHECK OUT", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
