import 'package:ecommerce_app/core/theming/change_theme_cubit.dart';
import 'package:ecommerce_app/features/bottom_nav_bar/ui/bloc/bottom_nav_bar_cubit.dart';
import 'package:ecommerce_app/features/cart/ui/bloc/cart_cubit.dart';
import 'package:ecommerce_app/features/category/ui/bloc/category_cubit.dart';
import 'package:ecommerce_app/features/product/ui/bloc/product_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency_injection.dart';

List<BlocProvider> appProviders() {
  return [
    BlocProvider<ProductCubit>(
      create: (context) => getIt<ProductCubit>(),
    ),
    BlocProvider<CategoryCubit>(
      create: (context) => getIt<CategoryCubit>(),
    ),
    BlocProvider<CartCubit>(
      create: (context) => getIt<CartCubit>(),
    ),
    BlocProvider<ChangeThemeCubit>(
      create: (context) => getIt<ChangeThemeCubit>(),
    ),
    BlocProvider<BottomNavBarCubit>(
      create: (context) => getIt<BottomNavBarCubit>(),
    ),
  ];
}
