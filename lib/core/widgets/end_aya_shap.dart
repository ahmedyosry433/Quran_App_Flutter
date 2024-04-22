import 'package:flutter/material.dart';
import 'package:quran_app/core/helper/convert_en_numbers_to_ar.dart';
import 'package:quran_app/core/theme/colors.dart';

import '../theme/style.dart';

class EndAyaShap extends StatelessWidget {
  const EndAyaShap({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Text(
      "\uFD3E${(index + 1).toString().toArabicNumbers}\uFD3F",
      style: TextStyles.font20BlackRegular.copyWith(shadows: [
         Shadow(
            offset:const Offset(.5, .5), blurRadius: 1.0, color: ColorsManager.black)
      ]),
    );
  }
}
