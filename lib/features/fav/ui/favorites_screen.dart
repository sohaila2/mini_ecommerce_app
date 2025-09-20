import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/app_spacing.dart';
import '../../../../core/widgets/app_values.dart';
import '../../../core/helpers/app_strings.dart';
import '../../../core/widgets/app_bar_global.dart';
import '../../product/ui/bloc/product_cubit.dart';
import '../../product/ui/widgets/products_gridview_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            final cubit = ProductCubit.of(context);
            final favorites = cubit.favoriteProducts;

            if (favorites.isEmpty) {
              return const Center(
                child: Text(
                  "No favorites yet",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }

            return Padding(
              padding: EdgeInsets.only(top: 12.sp, left: 24.0, right: 24.0),
              child: Column(
                children: [
                  AppBarGlobal(title: AppStrings.favoritesPage(context)),
                  AppSpace.vertical(AppHeight.h12),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(12),
                      physics: const AlwaysScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.58,
                      ),
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        final product = favorites[index];
                        return ProductsGridviewCard(product: product);
                      },
                    ),
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
