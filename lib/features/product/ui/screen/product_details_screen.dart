import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/theming/style.dart';
import 'package:ecommerce_app/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/widgets/app_bar_global.dart';
import '../../../../core/widgets/app_cache_image.dart';
import '../../../../core/widgets/app_spacing.dart';
import '../../../../core/widgets/app_values.dart';
import '../bloc/product_cubit.dart';
import '../widgets/add_to_cart_button.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cubit = ProductCubit.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 24.sp, right: 24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarGlobal(title: product.title),
              AppSpace.vertical(AppHeight.h12),
              // Product Image
              Center(
                child: AppCachImage(
                  image: product.image,
                  width: double.infinity,
                  height: 250,
                  isNotCircle: true,
                  borderRadius: BorderRadius.circular(12),
                  boxFit: BoxFit.contain,
                ),
              ),
              AppSpace.vertical(AppHeight.h16),
              // Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(product.title, style: TextStyles.font20Regular),
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
                ],
              ),
              AppSpace.vertical(AppHeight.h8),
              // Category
              Text(
                tr(AppStrings.category(context), namedArgs: {
                  'category': product.category.toString(),
                }),
                style: TextStyles.font14Regular.copyWith(
                  fontStyle: FontStyle.italic,
                  color: Colors.blueGrey,
                ),
              ),
              AppSpace.vertical(AppHeight.h8),
              // Price
              Text(
                "\$${product.price.toStringAsFixed(2)}",
                style: TextStyles.font18Medium.copyWith(
                  color: Colors.green,
                ),
              ),
              AppSpace.vertical(AppHeight.h12),
              // Rating
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  AppSpace.horizontal(AppWidth.w4),
                  Text(
                    tr(AppStrings.ratingReviews(context), namedArgs: {
                      'rate': product.rating.rate.toString(),
                      'count': product.rating.count.toString(),
                    }),
                    style: TextStyles.font14Regular
                        .copyWith(color: Colors.black54),
                  ),
                ],
              ),
              AppSpace.vertical(AppHeight.h16),
              // Description
              Text(
                product.description,
                style: TextStyles.font14Regular.copyWith(color: Colors.grey),
              ),
              AppSpace.vertical(AppHeight.h24),
              // Add to Cart button
              SizedBox(
                width: double.infinity,
                child: AddToCartButton(product: product),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
