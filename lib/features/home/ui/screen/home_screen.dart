import 'package:ecommerce_app/features/drawer/ui/drawer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/app_bar_main.dart';
import '../../../banner/ui/widgets/banner_carousel_widget.dart';
import '../../../category/ui/widgets/categories_listview_widget.dart';
import '../widgets/popular_brand.dart';
import '../../../product/ui/widgets/home_products_gridview_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerView(),
      body: IndexedStack(
        index: selectedIndex,
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 12.sp, left: 24.sp, right: 24.sp),
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    flexibleSpace: AppBarMain(),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        BannerCarouselWidget(),
                      ],
                    ),
                  ),
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    flexibleSpace: CategoriesListViewWidget(),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        PopularBrandListviewWidget(),
                        HomeProductsGridviewWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
