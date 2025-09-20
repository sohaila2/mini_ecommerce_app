import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theming/colors.dart';
import '../theming/style.dart';
import 'app_spacing.dart';
import 'app_values.dart';

class AppBarGlobal extends StatelessWidget {
  final bool isWithPadding;
  final void Function()? onTapBack;
  final String title;
  final bool isDefaultBackActive;
  const AppBarGlobal({
    super.key,
    this.isWithPadding = false,
    this.isDefaultBackActive = true,
    required this.title,
    this.onTapBack,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isWithPadding
          ? EdgeInsets.symmetric(horizontal: AppWidth.w16)
          : const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    isDefaultBackActive
                        ? Navigator.pop(context)
                        : onTapBack?.call();
                  },
                  child: Container(
                    padding: EdgeInsets.all(AppPadding.p5),
                    decoration: BoxDecoration(
                      color: ColorsManager.mainColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: ColorsManager.white,
                      size: AppSize.s18,
                    ),
                  ),
                ),
                AppSpace.horizontal(AppWidth.w10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyles.font16Medium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox.shrink(),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () => context.push(AppRoutes.favoritesScreen),
          )
        ],
      ),
    );
  }
}
