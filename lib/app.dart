import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/app_providers.dart';
import 'core/theming/change_theme_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: appProviders(),
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        path: 'assets/translations',
        startLocale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        child: ScreenUtilInit(
          designSize: const Size(406, 956),
          minTextAdapt: true,
          builder: (context, child) {
            return Builder(
              builder: (context) {
                return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
                  builder: (context, state) {
                    final themeCubit = context.read<ChangeThemeCubit>();

                    return MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      localizationsDelegates: context.localizationDelegates,
                      supportedLocales: context.supportedLocales,
                      locale: context.locale,
                      theme: themeCubit.themeData(),
                      routeInformationParser:
                          AppRouter.router.routeInformationParser,
                      routeInformationProvider:
                          AppRouter.router.routeInformationProvider,
                      routerDelegate: AppRouter.router.routerDelegate,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
