import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../helpers/app_images.dart';

class AppBarMain extends StatelessWidget {
  const AppBarMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(AppImages.logo),
        Row(
          spacing: 8.0,
          children: [
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
              child: Icon(Icons.search, color: Colors.black),
            ),
            GestureDetector(
              onTap: () {
                context.push(AppRoutes.cartScreen);
              },
              child: Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
                child: Icon(Icons.shopping_cart_outlined, color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
