class SurahModel {
  int index;
  String arabic;
  String latin;
  int verseCount;
  String type;
  List<VerseModel> verses;
  SurahModel({
    required this.index,
    required this.arabic,
    required this.latin,
    required this.verseCount,
    required this.type,
    required this.verses,
  });
}

class VerseModel {
  String number;
  String text;
  String translation;
  VerseModel({
    required this.number,
    required this.text,
    required this.translation,
  });
}
