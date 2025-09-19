import 'package:ecommerce_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/style.dart';
import '../../../../core/widgets/app_spacing.dart';
import '../../../../core/widgets/app_values.dart';
import '../bloc/category_cubit.dart';
import 'shimmer/categories_listview_shimmer.dart';

class CategoriesListViewWidget extends StatefulWidget {
  const CategoriesListViewWidget({super.key});

  @override
  State<CategoriesListViewWidget> createState() =>
      _CategoriesListViewWidgetState();
}

class _CategoriesListViewWidgetState extends State<CategoriesListViewWidget> {
  @override
  void initState() {
    super.initState();

    var cubit = CategoryCubit.of(context);
    cubit.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.sp),
      child: SizedBox(
        height: AppHeight.h35,
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            var cubit = CategoryCubit.of(context);

            if (state is Loading) {
              return const Center(child: CategoryListViewShimmer());
            }
            if (state is Error) {
              return Center(child: Text(state.error));
            }

            if (cubit.categoryList.isEmpty) {
              return const Center(child: Text("No products available"));
            }

            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.categoryList.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) =>
                  AppSpace.horizontal(AppWidth.w12),
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppWidth.w12,
                  ),
                  decoration: BoxDecoration(
                      color: ColorsManager.white,
                      border: Border.all(color: ColorsManager.mainColor),
                      borderRadius: BorderRadius.circular(AppRadius.rDefault)),
                  child: FittedBox(
                    child: Center(
                      child: Text(
                        cubit.categoryList[index].name,
                        style: TextStyles.font14Medium
                            .copyWith(color: ColorsManager.mainColor),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
