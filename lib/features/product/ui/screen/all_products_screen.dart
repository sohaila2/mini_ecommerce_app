import 'package:ecommerce_app/features/product/ui/widgets/products_gridview_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/widgets/app_bar_global.dart';
import '../../../../core/widgets/app_spacing.dart';
import '../../../../core/widgets/app_values.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarGlobal(title: AppStrings.allProducts(context)),
              AppSpace.vertical(AppHeight.h12),
              ProductsGridviewWidget()
            ],
          ),
        ),
      ),
    );
  }
}
