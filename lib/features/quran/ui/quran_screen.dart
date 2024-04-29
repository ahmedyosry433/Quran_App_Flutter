import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/helper/convert_en_numbers_to_ar.dart';
import 'package:quran_app/core/helper/extensions.dart';
import 'package:quran_app/core/helper/spacing.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/style.dart';
import 'package:quran_app/core/widgets/my_appbar.dart';
import 'package:quran_app/features/quran/data/model/quran_model.dart';
import 'package:quran_app/features/quran/data/quran_data.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: MyAppBar(title: 'quran'),
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/background.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
          child: buildQuranList()),
    );
  }

  Widget buildQuranList() {
    return SingleChildScrollView(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount: surahs.length,
          itemBuilder: (context, index) =>
              buildQuranCard(context: context, surah: surahs[index])),
    );
  }

  Widget buildQuranCard(
      {required BuildContext context, required SurahModel surah}) {
    return GestureDetector(
      onTap: () => context.pushNamed('surahDetailsScreen', arguments: surah),
      child: Card(
        color: ColorsManager.primary.withOpacity(0.35),
        elevation: 2,
        child: Padding(
          padding:
              EdgeInsets.only(top: 8.h, right: 8.w, bottom: 8.h, left: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                      width: 45.w,
                      height: 45.h,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset('assets/image/star.png'),
                          Positioned(
                            child: Text(surah.index.toArabicNumbers,
                                style: TextStyles.font16BlackRegular),
                          ),
                        ],
                      )),
                  horizontalSpace(10),
                  Text(
                    surah.arabic,
                    style: TextStyles.font16BlackRegular,
                  ),
                ],
              ),
              Column(children: [
                Text(surah.type, style: TextStyles.font13WhiteRegular),
                Text('${surah.verseCount} آيه',
                    style: TextStyles.font13WhiteRegular),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
