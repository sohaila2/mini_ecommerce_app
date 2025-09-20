import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../cart/ui/screen/cart_screen.dart';
import '../../../fav/ui/favorites_screen.dart';
import '../../../home/ui/screen/home_screen.dart';
import '../../../profile/ui/profile_screen.dart';
part 'bottom_nav_bar_cubit.freezed.dart';

@freezed
class BottomNavBarState with _$BottomNavBarState {
  const factory BottomNavBarState.initial() = _Initial;
  const factory BottomNavBarState.changeIndexState(int index) =
      ChangeIndexState;
}

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarState.initial());

  static BottomNavBarCubit get(BuildContext context) => context.read();

  final List<Widget> pages = [
    const HomeScreen(),
    const FavoritesScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavBarState.changeIndexState(index));
  }
}
