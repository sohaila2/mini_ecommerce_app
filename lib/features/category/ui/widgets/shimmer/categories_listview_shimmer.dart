import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_shimmer.dart';
import '../../../../../core/widgets/app_spacing.dart';
import '../../../../../core/widgets/app_values.dart';

class CategoryListViewShimmer extends StatelessWidget {
  const CategoryListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppHeight.h35,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: AppWidth.w16,
        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (context, index) => AppSpace.horizontal(AppWidth.w4),
        itemBuilder: (context, index) {
          return const CategoryListViewShimmerCard();
        },
      ),
    );
  }
}

class CategoryListViewShimmerCard extends StatelessWidget {
  const CategoryListViewShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: Container(
        width: AppWidth.w60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              AppRadius.rDefault,
            )),
      ),
    );
  }
}
