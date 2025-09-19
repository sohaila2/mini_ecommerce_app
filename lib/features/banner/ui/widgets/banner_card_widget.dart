import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/style.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_spacing.dart';
import '../../../../core/widgets/app_values.dart';

class BannercardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;

  const BannercardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: AppWidth.fullWidth(context),
          height: AppHeight.h320,
          margin: EdgeInsets.only(top: 20.h),
          padding: EdgeInsets.symmetric(
            horizontal: AppHeight.h20,
            vertical: AppHeight.h20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.rDefault),
            gradient: const LinearGradient(
              colors: [ColorsManager.mainColor, Colors.white],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: TextStyles.font18Regular.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              AppSpace.vertical(AppHeight.h8),
              Flexible(
                child: Text(
                  subtitle,
                  style: TextStyles.font16Regular.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              AppSpace.vertical(AppHeight.h12),
              AppButton(
                buttonWidth: AppWidth.w100,
                buttonHeight: AppHeight.h32,
                horizontalPadding: 4,
                verticalPadding: 2,
                backgroundColor: Colors.white,
                onPressed: () {},
                child: Text(AppStrings.shopNow(context),
                    style: TextStyles.font14Regular
                        .copyWith(color: ColorsManager.mainColor)),
              )
            ],
          ),
        ),
        Positioned(
          left: AppWidth.w75,
          bottom: AppHeight.h10,
          child: Image.asset(imagePath),
        ),
      ],
    );
  }
}
