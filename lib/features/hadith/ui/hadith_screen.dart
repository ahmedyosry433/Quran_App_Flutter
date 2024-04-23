import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/helper/spacing.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/style.dart';
import 'package:quran_app/core/widgets/my_appbar.dart';
import 'package:quran_app/features/hadith/data/hadith_data.dart';
import 'package:quran_app/features/hadith/data/model/hadith_model.dart';

class HadithScreen extends StatelessWidget {
  const HadithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.h),
            child: MyAppBar(title: 'hadith')),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/background.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: hadithList.length,
              itemBuilder: (context, index) =>
                  buildHadithWidget(hadith: hadithList[index]),
            ),
          ),
        ));
  }

  Widget buildHadithWidget({required HadithModel hadith}) {
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50.w,
                height: 50.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorsManager.primary.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  "${hadith.id}".tr(),
                  style: TextStyles.font16BlackRegular,
                  textAlign: TextAlign.center,
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: Text(
                  hadith.content,
                  style: TextStyles.font16BlackRegular,
                ),
              )
            ],
          ),
          Divider(color: ColorsManager.primary),
        ],
      ),
    );
  }
}
