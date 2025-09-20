import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/features/bottom_nav_bar/ui/bottom_nav_bar_screen.dart';
import 'package:ecommerce_app/features/cart/ui/screen/cart_screen.dart';
import 'package:ecommerce_app/features/fav/ui/favorites_screen.dart';
import 'package:ecommerce_app/features/home/ui/screen/home_screen.dart';
import 'package:ecommerce_app/features/product/ui/screen/all_products_screen.dart';
import 'package:ecommerce_app/features/profile/ui/profile_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.bottomNavBarScreen,
    routes: [
      GoRoute(
        name: AppRoutes.homeScreen,
        path: AppRoutes.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        name: AppRoutes.profileScreen,
        path: AppRoutes.profileScreen,
        builder: (context, state) => const ProfileScreen(),
      ),
      //? bottom nav bar
      GoRoute(
        name: AppRoutes.bottomNavBarScreen,
        path: AppRoutes.bottomNavBarScreen,
        builder: (context, state) => const BottomNavBarScreen(),
      ),
      GoRoute(
        name: AppRoutes.favoritesScreen,
        path: AppRoutes.favoritesScreen,
        builder: (context, state) => const FavoritesScreen(),
      ),
      GoRoute(
        name: AppRoutes.cartScreen,
        path: AppRoutes.cartScreen,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        name: AppRoutes.allProductsScreen,
        path: AppRoutes.allProductsScreen,
        builder: (context, state) => const AllProductsScreen(),
      ),
    ],
  );
}
