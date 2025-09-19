import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../theming/colors.dart';

class AppShimmer extends StatelessWidget {
  final Widget child;
  const AppShimmer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorsTheme.adaptiveShimmer(context),
      highlightColor: AppColorsTheme.adaptiveDarkAndLightGrey(context),
      child: child,
    );
  }
}
