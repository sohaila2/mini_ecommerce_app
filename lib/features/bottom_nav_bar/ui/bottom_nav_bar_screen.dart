import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/bottom_nav_bar_widget.dart';
import '../../drawer/ui/drawer_view.dart';
import 'bloc/bottom_nav_bar_cubit.dart';

class BottomNavBarScreen extends StatelessWidget {
  static GlobalKey<ScaffoldState> globalDrawerKey = GlobalKey<ScaffoldState>();

  const BottomNavBarScreen({super.key});

  static void openDrawer() {
    globalDrawerKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        final cubit = BottomNavBarCubit.get(context);
        return Scaffold(
          key: globalDrawerKey,
          drawer: const DrawerView(),
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: BtnNavBarWidget(
            selectedIndex: cubit.currentIndex,
            onItemTapped: cubit.changeIndex,
          ),
          body: cubit.pages[cubit.currentIndex],
        );
      },
    );
  }
}
