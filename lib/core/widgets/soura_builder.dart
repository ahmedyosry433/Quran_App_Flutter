// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../helper/shared_preferences_helper.dart';

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

class SouraBuilder extends StatefulWidget {
  int aya;
  final soura;
  final souraName;
  final arabic;

  SouraBuilder(
      {super.key, this.soura, this.souraName, this.arabic, required this.aya});

  @override
  State<SouraBuilder> createState() => _SouraBuilderState();
}

class _SouraBuilderState extends State<SouraBuilder> {
  bool isClicked = true;
  bool view = true;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => jumpToAya());
    super.initState();
  }

  jumpToAya() {
    if (isClicked) {
      itemScrollController.scrollTo(
          index: widget.aya,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInCubic);
    }
    isClicked = false;
  }

  saveBookMark(surah, aya) async {
    SharedPreferencesHelper.setValueForKey("surah", surah);
    SharedPreferencesHelper.setValueForKey("aya", aya);
  }

  Row verseBuilder(int index, pre) {
    return Row(
      children: [
        Expanded(
            child: Column(
          children: [
            Text(
              widget.arabic[index + pre]["aya_text"],
            )
          ],
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ReturnBasmala extends StatelessWidget {
  const ReturnBasmala({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
