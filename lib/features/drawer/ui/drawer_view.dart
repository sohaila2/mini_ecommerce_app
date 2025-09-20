import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/change_theme_cubit.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({super.key});

  @override
  State<DrawerView> createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {
  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == "ar";

    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 40.sp),
          children: [
            BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
              builder: (context, state) {
                var cubit = ChangeThemeCubit.get;
                return SwitchListTile(
                  title: Text("Light / Dark Mode"),
                  secondary: Icon(
                    cubit.isDark() ? Icons.dark_mode : Icons.light_mode,
                  ),
                  value: cubit.isDark(),
                  onChanged: (value) {
                    cubit.toggleTheme();
                  },
                );
              },
            ),
            SwitchListTile(
              title: Text("English / عربي"),
              secondary: const Icon(Icons.language),
              value: isArabic,
              onChanged: (value) {
                if (value) {
                  context.setLocale(const Locale("ar"));
                } else {
                  context.setLocale(const Locale("en"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
