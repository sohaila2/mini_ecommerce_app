import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/style.dart';
import '../../../../core/widgets/app_values.dart';
import '../theming/colors.dart';

class AppButton extends StatelessWidget {
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? buttonWidth;
  final double? buttonHeight;
  final String? buttonTitle;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  final BoxBorder? border;
  final Widget? child;

  const AppButton({
    super.key,
    this.borderRadius,
    this.backgroundColor,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonTitle,
    this.textStyle,
    required this.onPressed,
    this.textColor,
    this.border,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: buttonWidth ?? double.maxFinite,
        height: buttonHeight ?? AppHeight.h50,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding?.w ?? AppWidth.w12,
          vertical: verticalPadding?.h ?? AppHeight.h10,
        ),
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor ?? AppColorsTheme.adaptiveButton(context),
          borderRadius: BorderRadius.circular(
            borderRadius?.r ?? AppRadius.rDefault,
          ),
        ),
        child: child ??
            Text(
              buttonTitle ?? '',
              style: textStyle?.copyWith(
                    color: textColor ?? textStyle?.color ?? Colors.white,
                  ) ??
                  TextStyles.font14Bold.copyWith(
                    color: textColor ?? Colors.white,
                  ),
            ),
      ),
    );
  }
}
