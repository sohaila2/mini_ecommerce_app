import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:ecommerce_app/core/helpers/app_images.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/app_strings.dart';
import '../../../../core/widgets/app_values.dart';
import '../../../../core/widgets/dots_indicator_widget.dart';
import 'banner_card_widget.dart';

class BannerCarouselWidget extends StatefulWidget {
  const BannerCarouselWidget({super.key});

  @override
  State<BannerCarouselWidget> createState() => _BannerCarouselWidgetState();
}

class _BannerCarouselWidgetState extends State<BannerCarouselWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> banners = [
      BannercardWidget(
        title: AppStrings.offToday(context),
        subtitle: AppStrings.limitedTime(context),
        imagePath: AppImages.banner,
      ),
      BannercardWidget(
        title: AppStrings.newArrivals(context),
        subtitle: AppStrings.freshStyles(context),
        imagePath: AppImages.banner,
      ),
      BannercardWidget(
        title: AppStrings.freeShipping(context),
        subtitle: AppStrings.ordersAbove(context),
        imagePath: AppImages.banner,
      ),
    ];
    return SizedBox(
      height: AppHeight.fullHight(context) * .28,
      child: Stack(
        children: [
          //slider
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (i, reason) {
                setState(() => currentIndex = i);
              },
            ),
            items: banners,
          ),

          // Dots indicator
          Positioned(
            bottom: AppHeight.h10,
            left: 0,
            right: 0,
            child: DotsIndicatorWidget(
              length: banners.length,
              currentIndex: currentIndex,
            ),
          ),
        ],
      ),
    );
  }
}
