import 'package:cartella/features/cart/logic/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cartella/core/helper/spacing.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:cartella/core/widgets/custom_text_button.dart';
import 'package:cartella/features/cart/ui/widgets/cart_item.dart';
import 'package:cartella/features/cart/ui/widgets/promo_code_text_field.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cubit = context.read<CartCubit>();
          if (cubit.cartItems.isEmpty) {
            return Center(child: Text("Your Cart Is Empty !!"));
          }
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("My cart", style: TextStyles.font34myBlack700W),
                verticalSpacing(10),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cubit.cartItems[index];
                      return CartItem(
                        image: product.images[0],
                        price: product.price.toString(),
                        title: product.title,
                        onPressedDelete: () {
                          cubit.removeFromCart(product);
                        },
                      );
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
                      "${cubit.totalPrice} \$",
                      style: TextStyles.font14Black500W.copyWith(fontSize: 17),
                    ),
                  ],
                ),
                verticalSpacing(15),
                CustomTextButton(buttonText: "CHECK OUT", onPressed: () {}),
              ],
            ),
          );
        },
      ),
    );
  }
}
