import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/style.dart';
import 'package:quran_app/core/widgets/my_appbar.dart';
import 'package:quran_app/features/quran/data/model/quran_model.dart';

class SurahDetailsScreen extends StatelessWidget {
  SurahDetailsScreen({super.key, required this.surah});
  SurahModel surah;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lighterprimary,
      body: Padding(
        padding:
            EdgeInsets.only(top: 40.h, right: 10.w, left: 10.w, bottom: 10.h),
        child: SingleChildScrollView(
          child: buildSourahList(),
        ),
      ),
    );
  }

  Widget buildSourahList() {
    return Column(
      children: [
        Image.asset(
          'assets/image/basmala.png',
          height: 40.h,
        ),
        RichText(
          textAlign: TextAlign.justify,
          overflow: TextOverflow.visible,
          text: TextSpan(
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.black,
            ),
            children: surah.verses
                .map(
                  (e) => TextSpan(
                    text: '${e.text} ${e.number} ',
                    style: TextStyles.font16BlackRegular
                        .copyWith(fontFamily: 'Quran'),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
