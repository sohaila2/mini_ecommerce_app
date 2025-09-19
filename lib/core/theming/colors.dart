import 'package:flutter/material.dart';

class ColorsManager {
  static const Color mainColor = Color(0xff015B8A);
  static const Color mainSemiBoldColor = Color(0xff0D5A70);
  static const Color mainBoldColor = Color(0xff29344A);

  static const Color mainBolderColor = Color(0xff002616);
  static const Color mainLightColor = Color(0xffDEF4FF);
  static const Color mainLighterColor = Color(0xffF3FAFF);

  static const Color greyColor = Color(0xffB3B3B3);
  static const Color grey3Color = Color(0xffDAE9F0);
  //?---------------------------------------------------------
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color darkGrey = Color(0xff808080);
  static const Color deepGrey = Color(0xff5A5F62);
  static const Color yellow = Colors.yellow;
}

class AppColorsTheme {
  static bool isDarkMode({required BuildContext context}) {
    Brightness brightness = Theme.of(context).brightness;
    bool darkModeOn = brightness == Brightness.dark;
    return darkModeOn;
  }

  static Color blackAndWhite(BuildContext context) {
    return isDarkMode(context: context) ? Colors.black : Colors.white;
  }

  static Color adaptiveShimmer(BuildContext context) {
    return AppColorsTheme.isDarkMode(context: context)
        ? Colors.grey.shade800
        : Colors.grey.shade300;
  }

  static Color adaptiveMainBoldAndLight(BuildContext context) {
    return isDarkMode(context: context)
        ? ColorsManager.mainLighterColor
        : ColorsManager.mainBoldColor;
  }

  static Color adaptiveDarkAndLightGrey(BuildContext context) {
    return AppColorsTheme.isDarkMode(context: context)
        ? ColorsManager.darkGrey
        : Colors.grey[300]!;
  }

  static Color adaptiveButton(BuildContext context) {
    return isDarkMode(context: context)
        ? ColorsManager.mainLightColor
        : ColorsManager.mainColor;
  }
}
