import 'package:ecommerce_app/core/theming/change_theme_cubit.dart';
import 'package:ecommerce_app/features/bottom_nav_bar/ui/bloc/bottom_nav_bar_cubit.dart';
import 'package:ecommerce_app/features/cart/ui/bloc/cart_cubit.dart';
import 'package:ecommerce_app/features/product/data/apis/product_apis.dart';
import 'package:ecommerce_app/features/product/data/repos/product_repo.dart';
import 'package:ecommerce_app/features/category/ui/bloc/category_cubit.dart';
import 'package:ecommerce_app/features/product/ui/bloc/product_cubit.dart';
import 'package:get_it/get_it.dart';
import '../networking/dio_client.dart';

var getIt = GetIt.instance;

Future initDI() async {
  getIt.registerLazySingleton(() => DioClient());
  getIt.registerLazySingleton<ProductApi>(() => ProductApi(dioClient: getIt()));
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepository(api: getIt()));
  getIt.registerLazySingleton<ProductCubit>(
      () => ProductCubit(repository: getIt()));
  getIt.registerLazySingleton<CategoryCubit>(
      () => CategoryCubit(repository: getIt()));
  getIt.registerLazySingleton<CartCubit>(() => CartCubit());
  getIt.registerLazySingleton<ChangeThemeCubit>(() => ChangeThemeCubit());
  getIt.registerLazySingleton<BottomNavBarCubit>(() => BottomNavBarCubit());
}
