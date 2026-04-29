import 'package:cartella/core/helper/spacing.dart';
import 'package:cartella/core/theming/styles.dart';
import 'package:cartella/core/widgets/custom_text_button.dart';
import 'package:cartella/features/cart/logic/cubit/cart_cubit.dart';
import 'package:cartella/features/home/logic/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: 300.h,
                child: Card(
                  child: PageView.builder(
                    itemCount: widget.product.images.length,
                    onPageChanged: (value) {
                      setState(() {
                        currentImage = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.network(
                        widget.product.images[index],
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              verticalSpacing(15),
              Text(widget.product.title, style: TextStyles.font14Black500W),
              verticalSpacing(10),
              Text(
                "${widget.product.price} \$",
                style: TextStyles.font14LightBlack500W,
              ),
              verticalSpacing(10),
              Text(widget.product.description, textAlign: TextAlign.center),
              verticalSpacing(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ["S", "M", "L", "XL"].map((size) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Chip(label: Text(size)),
                  );
                }).toList(),
              ),
              verticalSpacing(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ["White", "Black", "Blue", "Green"].map((color) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Chip(label: Text(color)),
                  );
                }).toList(),
              ),
              verticalSpacing(40),
              CustomTextButton(
                buttonText: "Add to Cart",
                onPressed: () {
                  context.read<CartCubit>().addToCart(widget.product);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Added to cart")));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
