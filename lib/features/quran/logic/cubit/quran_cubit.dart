// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/features/quran/data/model/quran_models.dart';
import 'package:quran_app/features/quran/data/repo/quran_repo.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this.quranRepo) : super(QuranInitial());
  final QuranRepo quranRepo;
  Future getAllQuranCubit() async {
    emit(QuranLoding());
    try {
      var res = await quranRepo.getAllSurahsRepo();
      // print('__________________________${res.surah[0].arabicName}');
      emit(QuranSuccess(surah: res.surah));
    } catch (e) {
      // print('_______erorr___________________$e');
      emit(QuranError(error: e.toString()));
    }
  }
}
