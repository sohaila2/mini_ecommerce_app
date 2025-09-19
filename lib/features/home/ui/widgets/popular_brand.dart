import 'package:ecommerce_app/core/helpers/app_images.dart';
import 'package:ecommerce_app/core/theming/style.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_strings.dart';
import '../../../../core/widgets/app_spacing.dart';
import '../../../../core/widgets/app_values.dart';

class PopularBrandListviewWidget extends StatelessWidget {
  const PopularBrandListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final brands = [
      {"name": "H&M", "image": AppImages.hmBrand},
      {"name": "Zara", "image": AppImages.zaraBrand},
      {"name": "Lacoste", "image": AppImages.lascoteBrand},
      {"name": "Polo", "image": AppImages.polo},
      {"name": "Pull And Bear", "image": AppImages.pullAndBear},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.popularBrand(context),
          style: TextStyles.font20Regular,
        ),
        AppSpace.vertical(AppHeight.h12),
        Container(
          width: AppWidth.fullWidth(context),
          margin: EdgeInsets.only(bottom: AppHeight.h20),
          height: AppHeight.h125,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: brands.length,
            separatorBuilder: (context, index) => SizedBox(width: AppWidth.w20),
            itemBuilder: (context, index) {
              final brand = brands[index];
              return Column(
                children: [
                  Container(
                    width: AppWidth.w80,
                    height: AppHeight.h80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(brand["image"]!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  AppSpace.vertical(AppHeight.h10),
                  Text(
                    brand["name"]!,
                    style: TextStyle(
                      fontSize: AppFontSize.f14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
