import 'package:flutter/material.dart';
import 'package:quran_app/core/router/routes.dart';
import 'package:quran_app/features/azkar/ui/azkar_masaa_screen.dart';
import 'package:quran_app/features/azkar/ui/azkar_sabah_screen.dart';
import 'package:quran_app/features/hadith/ui/hadith_screen.dart';
import 'package:quran_app/features/home/ui/home_screen.dart';

import '../../features/splash/ui/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
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
