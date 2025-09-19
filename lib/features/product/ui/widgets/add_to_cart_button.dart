import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/features/cart/ui/bloc/cart_cubit.dart';
import 'package:ecommerce_app/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_values.dart';

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({super.key, required this.product});
  final ProductModel product;
  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cubit = CartCubit.of(context);

        final isInCart = cubit.isInCart(widget.product);

        return AppButton(
          onPressed: () {
            if (isInCart) {
              cubit.removeFromCart(widget.product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    tr(AppStrings.removedFromCart(context), namedArgs: {
                      'title': widget.product.title.toString(),
                    }),
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            } else {
              cubit.addToCart(widget.product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    tr(AppStrings.addedToCart(context), namedArgs: {
                      'title': widget.product.title.toString(),
                    }),
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            }
          },
          buttonWidth: AppWidth.fullWidth(context),
          buttonTitle: isInCart
              ? AppStrings.remove(context)
              : AppStrings.addToCart(context),
          backgroundColor: isInCart ? Colors.red : ColorsManager.mainColor,
        );
      },
    );
  }
}
