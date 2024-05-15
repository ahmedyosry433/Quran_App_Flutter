import 'package:get_it/get_it.dart';
import 'package:quran_app/core/networking/service.dart';
import 'package:quran_app/features/quran/data/repo/quran_repo.dart';
import 'package:quran_app/features/quran/logic/cubit/quran_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<Service>(() => Service());

  getIt.registerLazySingleton(() => QuranRepo(service: getIt()));
  getIt.registerFactory<QuranCubit>(() => QuranCubit(getIt()));
}
