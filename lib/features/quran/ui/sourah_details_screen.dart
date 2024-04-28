import 'package:flutter/material.dart';
import 'package:quran_app/features/quran/data/model/quran_model.dart';

class SurahDetailsScreen extends StatelessWidget {
  SurahDetailsScreen({super.key, required this.surah});
  SurahModel surah;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildSourahList(),
    );
  }

  Widget buildSourahList() {
    return ListView.builder(
      itemCount: surah.verses.length,
      itemBuilder: (context, index) {
        return Text('${surah.verses[index].text}');
      },
    );
  }
}
