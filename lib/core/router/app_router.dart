import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/dj/dj.dart';
import 'package:quran_app/core/router/routes.dart';
import 'package:quran_app/features/azkar/ui/azkar_masaa_screen.dart';
import 'package:quran_app/features/azkar/ui/azkar_sabah_screen.dart';
import 'package:quran_app/features/hadith/logic/cubit/hadith_cubit.dart';
import 'package:quran_app/features/hadith/ui/hadith_screen.dart';
import 'package:quran_app/features/home/ui/home_screen.dart';
import 'package:quran_app/features/quran/data/model/quran_models.dart';
import 'package:quran_app/features/quran/logic/cubit/quran_cubit.dart';
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
          builder: (context) => BlocProvider.value(
            value: HadithCubit(),
            child: BlocProvider.value(
              value: QuranCubit(getIt()),
              child: const HomeScreen(),
            ),
          ),
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
          builder: (context) => BlocProvider(
            create: (context) => getIt<QuranCubit>(),
            child: SurahDetailsScreen(surah: argument as Surah),
          ),
        );
      case Routes.quranScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<QuranCubit>(),
            child: const QuranScreen(),
          ),
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
