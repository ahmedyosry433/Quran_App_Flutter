import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/core/theme/colors.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // app bar theme
    appBarTheme: AppBarTheme(
      // centerTitle: true,
      // color: ColorsManager.primary,
      elevation: 4,
      shadowColor: ColorsManager.primary.withOpacity(0.85),
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: ColorsManager.primary.withOpacity(0.85),
        statusBarColor: ColorsManager.primary.withOpacity(0.3),
        statusBarBrightness: Brightness.dark,
        // systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: ColorsManager.white,
      ),
    ),
  );
}
