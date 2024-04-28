import 'package:flutter/material.dart';
import 'package:quran_app/core/router/routes.dart';
import 'package:quran_app/features/azkar/ui/azkar_masaa_screen.dart';
import 'package:quran_app/features/azkar/ui/azkar_sabah_screen.dart';
import 'package:quran_app/features/hadith/ui/hadith_screen.dart';
import 'package:quran_app/features/home/ui/home_screen.dart';
import 'package:quran_app/features/quran/data/model/quran_model.dart';
import 'package:quran_app/features/quran/ui/sourah_details_screen.dart';
import 'package:quran_app/features/tasbih/data/model/tasbih_model.dart';
import 'package:quran_app/features/tasbih/ui/tasbih_details_screen.dart';
import 'package:quran_app/features/tasbih/ui/tasbih_screen.dart';
import 'package:quran_app/features/quran/ui/quran_screen.dart';

import '../../features/splash/ui/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case Routes.hadithScreen:
        return MaterialPageRoute(
          builder: (_) => const HadithScreen(),
        );
      case Routes.azkarMasaaScreen:
        return MaterialPageRoute(
          builder: (_) => const AzkarMasaaScreen(),
        );
      case Routes.azkarSabahScreen:
        return MaterialPageRoute(
          builder: (_) => const AzkarSabahScreen(),
        );
      case Routes.tasbihScreen:
        return MaterialPageRoute(
          builder: (_) => const TasbihScreen(),
        );
      case Routes.tasbihDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => TasbihDetailsScreen(tasbih: argument as TasbihModel),
        );
      case Routes.surahDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => SurahDetailsScreen(surah: argument as SurahModel),
        );
      case Routes.quranScreen:
        return MaterialPageRoute(
          builder: (_) => const QuranScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(' No Route Defined For ${settings.name}'),
            ),
          ),
        );
    }
  }
}
