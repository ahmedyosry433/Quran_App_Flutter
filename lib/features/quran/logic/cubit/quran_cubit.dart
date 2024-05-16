// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/data/model/quran_models.dart';
import 'package:quran_app/features/quran/data/repo/quran_repo.dart';
import 'package:collection/collection.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit(this.quranRepo) : super(QuranInitial());
  final QuranRepo quranRepo;
  List<List<Ayah>> pages = [];
  List<Surah> surahs = [];
  int currentPageNumber = 1;
   List<int> downThePageIndex = [
    75,
    206,
    330,
    340,
    348,
    365,
    375,
    413,
    416,
    444,
    451,
    497,
    505,
    524,
    547,
    554,
    556,
    583
  ];
List<int> topOfThePageIndex = [
    76,
    207,
    331,
    341,
    349,
    366,
    376,
    414,
    417,
    435,
    445,
    452,
    498,
    506,
    525,
    548,
    554,
    555,
    557,
    583,
    584
  ];

  List<Ayah> allAyahs = [];
  PageController quranPageController = PageController();

  PageController get pageController {
    return quranPageController =
        PageController(initialPage: currentPageNumber - 1, keepPage: true);
  }

  Future getAllQuranCubit() async {
    emit(QuranLoding());
    try {
      var res = await quranRepo.getAllSurahsRepo();
      surahs = res.surah;
      for (final surah in res.surah) {
        allAyahs.addAll(surah.ayahs);
        // log('Added ${surah.arabicName} ayahs');
      }
      List.generate(604, (pageIndex) {
        pages
            .add(allAyahs.where((ayah) => ayah.page == pageIndex + 1).toList());
        log('Pages Length: ${pages.length}');
      });

      emit(QuranSuccess(surah: res.surah));
    } catch (e) {
      emit(QuranError(error: e.toString()));
    }
  }

  List<Ayah> getCurrentPageAyahs(int pageIndex) => pages[pageIndex];

  // int getSurahNumberFromPage(int pageNumber) => surahs
  //     .firstWhere(
  //         (s) => s.ayahs.contains(getCurrentPageAyahs(pageNumber).first))
  //     .surahNumber;
  List<List<Ayah>> getCurrentPageAyahsSeparatedForBasmalah(int pageIndex) =>
      pages[pageIndex]
          .splitBetween((f, s) => f.ayahNumber > s.ayahNumber)
          .toList();
  int getSurahNumberByAyah(Ayah ayah) =>
      surahs.firstWhere((s) => s.ayahs.contains(ayah)).surahNumber;

  String getSurahNameFromPage(int pageNumber) {
    try {
      return surahs
          .firstWhere(
              (s) => s.ayahs.contains(getCurrentPageAyahs(pageNumber).first))
          .arabicName;
    } catch (e) {
      return "Surah not found";
    }
  }

  Future<void> pageChanged(int index) async {
    currentPageNumber = index + 1;
    // print('_________________$index');
  }
}
