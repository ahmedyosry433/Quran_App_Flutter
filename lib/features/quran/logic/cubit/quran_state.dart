part of 'quran_cubit.dart';

@immutable
sealed class QuranState {}

final class QuranInitial extends QuranState {}

final class QuranLoding extends QuranState {}

final class QuranSuccess extends QuranState {
  final List<Surah> surah;
  QuranSuccess({required this.surah});
}

final class QuranError extends QuranState {
  final String error;
  QuranError({required this.error});
}

final class PageNumberLoding extends QuranState {}

final class PageNumberSuccess extends QuranState {}

final class PageNumberError extends QuranState {
  final String error;
  PageNumberError({required this.error});
}
