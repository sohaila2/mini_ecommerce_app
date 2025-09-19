import 'package:ecommerce_app/core/helpers/app_images.dart';
import 'package:ecommerce_app/core/networking/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppCachImage extends StatelessWidget {
  final String image;
  final String? defaultImage;
  final double? width;
  final double? height;
  final bool isNotCircle;
  final BoxFit? boxFit;
  final BoxFit? placeholderFit;
  final bool isNoBaseUrl;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final Color? placeholderColor;

  const AppCachImage({
    super.key,
    required this.image,
    this.defaultImage,
    this.width,
    this.height,
    this.isNotCircle = false,
    this.boxFit,
    this.placeholderFit,
    this.isNoBaseUrl = false,
    this.backgroundColor,
    this.borderRadius,
    this.placeholderColor,
  });

  @override
  Widget build(BuildContext context) {
    final resolvedUrl = (image.startsWith("http") || isNoBaseUrl)
        ? image
        : '${ApiConstants.baseUrl}/$image';

    return ClipRRect(
      borderRadius: isNotCircle
          ? borderRadius ?? BorderRadius.circular(8)
          : BorderRadius.zero,
      child: Image.network(
        resolvedUrl,
        width: width ?? 70.sp,
        height: height ?? 70.sp,
        fit: boxFit ?? BoxFit.cover,
        errorBuilder: (context, url, error) => Container(
          width: width ?? 70.sp,
          height: height ?? 70.sp,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            borderRadius:
                isNotCircle ? borderRadius ?? BorderRadius.circular(8) : null,
            shape: isNotCircle ? BoxShape.rectangle : BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(defaultImage ?? AppImages.placeholder),
              colorFilter: placeholderColor != null
                  ? ColorFilter.mode(placeholderColor!, BlendMode.srcIn)
                  : null,
              fit: placeholderFit ?? BoxFit.cover,
            ),
          ),
        ),
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            width: width ?? 70.sp,
            height: height ?? 70.sp,
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.transparent,
              borderRadius:
                  isNotCircle ? borderRadius ?? BorderRadius.circular(8) : null,
              shape: isNotCircle ? BoxShape.rectangle : BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(defaultImage ?? AppImages.placeholder),
                colorFilter: placeholderColor != null
                    ? ColorFilter.mode(placeholderColor!, BlendMode.srcIn)
                    : null,
                fit: placeholderFit ?? BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
