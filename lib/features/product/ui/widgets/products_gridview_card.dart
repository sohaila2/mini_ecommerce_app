import 'package:ecommerce_app/core/theming/style.dart';
import 'package:ecommerce_app/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_cache_image.dart';
import '../../../../core/widgets/app_spacing.dart';
import '../../../../core/widgets/app_values.dart';
import '../screen/product_details_screen.dart';
import '../bloc/product_cubit.dart';
import 'add_to_cart_button.dart';

class ProductsGridviewCard extends StatelessWidget {
  const ProductsGridviewCard({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cubit = ProductCubit.of(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Container(
        width: AppWidth.fullWidth(context) * .5,
        decoration: BoxDecoration(
          color: AppColorsTheme.blackAndWhite(context),
          borderRadius: BorderRadius.circular(
            AppRadius.rDefault,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: AppCachImage(
              image: product.image,
              width: AppWidth.fullWidth(context),
              borderRadius: BorderRadius.zero,
              isNotCircle: true,
              boxFit: BoxFit.contain,
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.font14Medium,
                  ),
                  AppSpace.vertical(AppHeight.h4),
                  Text(
                    "\$${product.price.toStringAsFixed(2)}",
                    style: TextStyles.font16Bold.copyWith(
                      color: Colors.green,
                    ),
                  ),
                  IconButton(
                    onPressed: () => cubit.toggleFavorite(product),
                    icon: Icon(
                      cubit.isFavorite(product)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color:
                          cubit.isFavorite(product) ? Colors.red : Colors.grey,
                    ),
                  ),
                  AppSpace.vertical(AppHeight.h8),
                  AddToCartButton(
                    product: product,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
