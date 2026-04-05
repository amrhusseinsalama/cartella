import 'package:flutter/material.dart';
import 'package:cartella/core/helper/spacing.dart';
import 'package:cartella/core/theming/colors.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:cartella/core/widgets/circle_action_button.dart';
import 'package:cartella/core/widgets/custom_tile_container.dart';

class BagItem extends StatelessWidget {
  const BagItem({super.key});

  Widget counterCircleActioButton(IconData icon) {
    return CircleActionButton(
      icon: icon,
      iconColor: ColorsManager.mygray,
      onPressed: () {},
      backgroundColor: ColorsManager.mywhite,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomTileContainer(
      color: ColorsManager.mywhite,
      child: Row(
        children: [
          Image.asset("assets/images/my_bag.png"),
          horizentalSpacing(10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Pullover", style: TextStyles.font14Black500W),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Color: ",
                        style: TextStyles.font11Graye600W.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(text: "Blue"),
                      WidgetSpan(child: horizentalSpacing(25)),
                      TextSpan(
                        text: "Size: ",
                        style: TextStyles.font11Graye600W.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(text: "L\n"),
                    ],
                  ),
                ),
                Row(
                  children: [
                    counterCircleActioButton(Icons.remove),
                    horizentalSpacing(10),
                    Text("1"),
                    horizentalSpacing(10),
                    counterCircleActioButton(Icons.add),
                  ],
                ),
              ],
            ),
          ),
          horizentalSpacing(40),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.more_vert, color: ColorsManager.mygray,),
                Text("51\$" , style: TextStyles.font14Black500W,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
