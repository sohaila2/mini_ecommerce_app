import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theming/colors.dart';
import '../bloc/bottom_nav_bar_cubit.dart';
import '../../../../core/helpers/app_strings.dart';

class BtnNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BtnNavBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BtnNavBarItem(
            icon: Icons.home,
            label: AppStrings.home(context),
            index: 0,
            selectedIndex: selectedIndex,
            onTap: onItemTapped,
          ),
          BtnNavBarIcon(
            icon: Icons.favorite_border_outlined,
            index: 1,
            selectedIndex: selectedIndex,
            onTap: onItemTapped,
          ),
          BtnNavBarIcon(
            icon: Icons.shopping_cart_outlined,
            index: 2,
            selectedIndex: selectedIndex,
            onTap: onItemTapped,
          ),
          BtnNavBarIcon(
            icon: Icons.person_outline,
            index: 3,
            selectedIndex: selectedIndex,
            onTap: onItemTapped,
          ),
        ],
      ),
    );
  }
}

class BtnNavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;

  const BtnNavBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<BottomNavBarCubit>();

    return GestureDetector(
      onTap: () {
        cubit.changeIndex(0);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: cubit.currentIndex == 0
              ? ColorsManager.mainColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(icon,
                color: cubit.currentIndex == 0 ? Colors.white : Colors.grey),
            if (cubit.currentIndex == 0) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class BtnNavBarIcon extends StatelessWidget {
  final IconData icon;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;

  const BtnNavBarIcon({
    super.key,
    required this.icon,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Icon(
        icon,
        color: isSelected ? ColorsManager.mainColor : Colors.grey,
      ),
    );
  }
}
