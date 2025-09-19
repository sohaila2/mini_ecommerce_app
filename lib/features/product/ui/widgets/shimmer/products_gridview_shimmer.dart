import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/app_shimmer.dart';
import '../../../../../core/widgets/app_spacing.dart';
import '../../../../../core/widgets/app_values.dart';

class InstructorGridviewShimmer extends StatelessWidget {
  const InstructorGridviewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.65,
      ),
      itemCount: 6,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return const InstructorGridviewCardShimmer();
      },
    );
  }
}

class InstructorGridviewCardShimmer extends StatelessWidget {
  final double? width;

  const InstructorGridviewCardShimmer({
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //image
          AppShimmer(
            child: Container(
              width: AppWidth.fullWidth(context),
              height: AppHeight.h100,
              decoration: BoxDecoration(
                color: ColorsManager.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.rDefault),
                  topRight: Radius.circular(AppRadius.rDefault),
                ),
              ),
            ),
          ),
          AppSpace.vertical(AppHeight.h6),
          AppShimmer(
            child: Container(
              width: AppWidth.w70,
              height: AppHeight.h16,
              color: ColorsManager.white,
            ),
          ),
          AppShimmer(
            child: Container(
              width: AppWidth.w90,
              height: AppHeight.h16,
              color: ColorsManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
