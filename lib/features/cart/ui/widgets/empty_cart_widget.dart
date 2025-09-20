import 'package:ecommerce_app/core/theming/style.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/widgets/app_spacing.dart';
import '../../../../core/widgets/app_values.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.shopping_cart_outlined,
              size: 100, color: Colors.grey),
          AppSpace.vertical(AppHeight.h16),
          Text(
            AppStrings.emptyCart(context),
            style: TextStyles.font18Bold.copyWith(
              color: Colors.grey,
            ),
          ),
          AppSpace.vertical(AppHeight.h8),
          Text(
            AppStrings.addProducts(context),
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
