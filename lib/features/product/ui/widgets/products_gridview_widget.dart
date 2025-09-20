import 'package:ecommerce_app/features/product/ui/widgets/shimmer/products_gridview_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/app_strings.dart';
import '../../../../core/widgets/app_values.dart';
import '../bloc/product_cubit.dart';
import 'products_gridview_card.dart';

class ProductsGridviewWidget extends StatelessWidget {
  const ProductsGridviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          var cubit = ProductCubit.of(context);

          if (state is Loading) {
            return const Center(child: InstructorGridviewShimmer());
          }
          if (state is Error) {
            return Center(child: Text(state.error));
          }

          if (cubit.productList.isEmpty) {
            return Center(child: Text(AppStrings.noProducts(context)));
          }

          return SizedBox(
            height: AppHeight.fullHight(context),
            child: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 12.sp),
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.58,
              ),
              itemCount: cubit.productList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final product = cubit.productList[index];

                return ProductsGridviewCard(
                  product: product,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
