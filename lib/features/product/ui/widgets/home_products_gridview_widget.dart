import 'package:ecommerce_app/features/product/ui/widgets/products_gridview_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/widgets/app_spacing.dart';
import '../../../../core/widgets/app_title_with_action.dart';
import '../../../../core/widgets/app_values.dart';
import '../bloc/product_cubit.dart';
import 'shimmer/products_gridview_shimmer.dart';

class HomeProductsGridviewWidget extends StatefulWidget {
  const HomeProductsGridviewWidget({super.key});

  @override
  State<HomeProductsGridviewWidget> createState() =>
      _HomeProductsGridviewWidgetState();
}

class _HomeProductsGridviewWidgetState
    extends State<HomeProductsGridviewWidget> {
  @override
  void initState() {
    super.initState();
    ProductCubit.of(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
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

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitleWithAction(
              onTap: () {
                context.push(AppRoutes.allProductsScreen);
              },
              title: AppStrings.flashSale(context),
            ),
            AppSpace.vertical(AppHeight.h20),
            GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 12.sp),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.58,
              ),
              itemCount: cubit.productList.take(4).length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final product = cubit.productList[index];

                return ProductsGridviewCard(
                  product: product,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
