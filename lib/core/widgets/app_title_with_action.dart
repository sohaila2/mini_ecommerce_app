import 'package:ecommerce_app/core/helpers/app_strings.dart';
import 'package:flutter/material.dart';

import '../theming/colors.dart';
import '../theming/style.dart';
import 'app_spacing.dart';
import 'app_values.dart';

class AppTitleWithAction extends StatelessWidget {
  final String title;
  final String? actionTitle;
  final TextStyle? titleStyle;
  final void Function()? onTap;
  const AppTitleWithAction({
    super.key,
    required this.title,
    this.onTap,
    this.actionTitle,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: titleStyle ?? TextStyles.font20Regular,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                actionTitle ?? AppStrings.seeAll(context),
                style: TextStyles.font12Medium.copyWith(
                  color: AppColorsTheme.adaptiveMainBoldAndLight(context),
                ),
              ),
              AppSpace.horizontal(6),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppColorsTheme.adaptiveMainBoldAndLight(context),
                size: AppSize.s20,
              )
            ],
          ),
        ],
      ),
    );
  }
}
