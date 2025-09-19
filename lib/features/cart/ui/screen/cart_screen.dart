import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/helpers/app_images.dart';
import 'package:ecommerce_app/core/helpers/app_strings.dart';
import 'package:ecommerce_app/core/widgets/app_button.dart';
import 'package:ecommerce_app/features/cart/ui/bloc/cart_cubit.dart';
import 'package:ecommerce_app/features/cart/ui/widgets/empty_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/style.dart';
import '../../../../core/widgets/app_bar_global.dart';
import '../../../../core/widgets/app_spacing.dart';
import '../../../../core/widgets/app_values.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cubit = CartCubit.of(context);

            if (cubit.cartItems.isEmpty) {
              return EmptyCartWidget();
            }

            return Padding(
              padding: EdgeInsets.only(top: 12.sp, left: 24.0, right: 24.0),
              child: Column(
                children: [
                  AppBarGlobal(title: AppStrings.cart(context)),
                  AppSpace.vertical(AppHeight.h12),
                  // Cart items
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit.cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cubit.cartItems[index];
                        return CartItemWidget(
                          cartItem: cartItem,
                          onRemove: () {
                            cubit.removeFromCart(cartItem.product);
                          },
                          onIncrease: () {
                            cubit.increaseQuantity(cartItem.product);
                          },
                          onDecrease: () {
                            cubit.decreaseQuantity(cartItem.product);
                          },
                        );
                      },
                    ),
                  ),

                  const Divider(),
                  // Shipping Info
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.paymentInfo(context),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  AppSpace.vertical(AppHeight.h8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Image.asset(AppImages.card),
                        SizedBox(width: 12),
                        Expanded(child: Text(AppStrings.cardNumber(context))),
                        Icon(Icons.keyboard_arrow_down),
                      ],
                    ),
                  ),
                  AppSpace.vertical(AppHeight.h16),
                  // Summary
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tr(AppStrings.subtotal(context), namedArgs: {
                          'count': cubit.cartItemCount.toString(),
                        }),
                      ),
                      Text("\$${cubit.subtotal.toStringAsFixed(2)}"),
                    ],
                  ),
                  AppSpace.vertical(AppHeight.h4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.shippingFee(context)),
                      Text("\$${cubit.shippingFee.toStringAsFixed(2)}"),
                    ],
                  ),
                  AppSpace.vertical(AppHeight.h4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppStrings.taxes(context)),
                      Text("\$${cubit.taxes.toStringAsFixed(2)}"),
                    ],
                  ),
                  AppSpace.vertical(AppHeight.h8),
                  const Divider(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.total(context),
                        style: TextStyles.font16Bold,
                      ),
                      Text(
                        "\$${cubit.total.toStringAsFixed(2)}",
                        style: TextStyles.font16Bold,
                      ),
                    ],
                  ),
                  AppSpace.vertical(AppHeight.h12),
                  AppButton(
                    onPressed: () {},
                    buttonWidth: AppWidth.fullWidth(context),
                    buttonTitle: AppStrings.checkout(context),
                    backgroundColor: ColorsManager.mainColor,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
