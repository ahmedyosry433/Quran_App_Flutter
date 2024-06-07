import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quran_app/core/networking/api_service.dart';
import 'package:quran_app/core/networking/dio_factory.dart';
import 'package:quran_app/core/networking/service.dart';
import 'package:quran_app/features/prayer_time/data/repo/prayer_time_repo.dart';
import 'package:quran_app/features/prayer_time/logic/cubit/prayer_time_cubit.dart';
import 'package:quran_app/features/quran/data/repo/quran_repo.dart';
import 'package:quran_app/features/quran/logic/cubit/quran_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();

  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
//Json Service
  getIt.registerLazySingleton<Service>(() => Service());

//Quran
  getIt.registerLazySingleton(() => QuranRepo(service: getIt()));

  getIt.registerFactory<QuranCubit>(() => QuranCubit(getIt()));
// Prayer Time
  getIt.registerLazySingleton(() => PrayerTimeRepo(apiService: getIt()));

  getIt.registerFactory<PrayerTimeCubit>(() => PrayerTimeCubit(getIt()));
}
