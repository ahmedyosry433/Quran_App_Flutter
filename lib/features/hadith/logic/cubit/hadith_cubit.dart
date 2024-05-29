// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/features/hadith/data/model/hadith_model.dart';

part 'hadith_state.dart';

class HadithCubit extends Cubit<HadithState> {
  HadithCubit() : super(HadithInitial());
  List<HadithModel> hadithList = [];
  // int dailyIndex = getDailyRandomIndex(hadithList.length);

  int getDailyRandomIndex(int listLength) {
    // Get the current date
    DateTime now = DateTime.now();
    // Combine the year, month, and day to create a seed
    int seed = now.year * 10000 + now.month * 100 + now.day;
    // Create a random number generator with the seed
    Random random = Random(seed);
    // Generate a random index
    return random.nextInt(listLength);
  }
} 
