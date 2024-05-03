// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:quran_app/core/helper/convert_en_numbers_to_ar.dart';
import 'package:quran_app/core/helper/extensions.dart';
import 'package:quran_app/core/helper/spacing.dart';
import 'package:quran_app/core/router/routes.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/style.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final jHijri = JHijri.now();
  var dateFormated =
      DateFormat('d-MMMM-yyyy', 'ar').format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/background.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: Image.asset(
                  'assets/image/arrow.png',
                  width: 40.w,
                  height: 40.h,
                ),
              ),
            ),
            buildDateTimeCardAndAnimationImage(),
            buildCategories(context),
          ],
        ),
      ),
    );
  }

  Widget buildDateTimeCardAndAnimationImage() {
    return Padding(
      padding: EdgeInsets.only(top: 0.h, right: 10.w, left: 10.w, bottom: 10.h),
      child: Column(
        children: [
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '${jHijri.day.toArabicNumbers}-',
                    style: TextStyles.font18BlackRegular,
                  ),
                  Text(
                    jHijri.monthName,
                    style: TextStyles.font18BlackRegular,
                  ),
                  Text(
                    '-${jHijri.year.toArabicNumbers}',
                    style: TextStyles.font18BlackRegular,
                  ),
                ],
              ),
              Text(
                dateFormated,
                style: TextStyles.font18BlackRegular,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCategories(BuildContext context) {
    return Container(
      width: 320.w,
      height: 450.h,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorsManager.primarySwatch.withOpacity(0.65),
            spreadRadius: 0,
            blurRadius: 0,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        color: ColorsManager.transparentColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.h, right: 15.w, left: 15.w, bottom: 5.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => context.pushNamed(Routes.quranScreen),
                  child: Container(
                    height: 110.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                        color: ColorsManager.primarySwatch,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      children: [
                        verticalSpace(10),
                        Image.asset('assets/image/quran.png',
                            width: 60.w, height: 60.h),
                        verticalSpace(10),
                        Text(
                          'quran'.tr(),
                          style: TextStyles.font17WhiteRegular,
                        )
                      ],
                    ),
                  ),
                ),
                horizontalSpace(15),
                Container(
                  height: 110.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                      color: ColorsManager.primarySwatch,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    children: [
                      verticalSpace(10),
                      Image.asset('assets/image/mark.png',
                          width: 60.w, height: 60.h),
                      verticalSpace(10),
                      Text(
                        'marks'.tr(),
                        style: TextStyles.font17WhiteRegular,
                      )
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => context.pushNamed(Routes.hadithScreen),
                  child: Container(
                    height: 110.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                        color: ColorsManager.primarySwatch,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      children: [
                        verticalSpace(10),
                        Image.asset('assets/image/hadith.png',
                            width: 60.w, height: 60.h),
                        verticalSpace(10),
                        Text(
                          'hadith'.tr(),
                          style: TextStyles.font17WhiteRegular,
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpace(15),
                Container(
                  height: 110.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                      color: ColorsManager.primarySwatch,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: GestureDetector(
                    onTap: () => context.pushNamed(Routes.tasbihScreen),
                    child: Column(
                      children: [
                        verticalSpace(10),
                        Image.asset('assets/image/tasbih.png',
                            width: 60.w, height: 60.h),
                        verticalSpace(10),
                        Text(
                          'tasbih'.tr(),
                          style: TextStyles.font17WhiteRegular,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => context.pushNamed(Routes.azkarSabahScreen),
                  child: Container(
                    height: 110.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                        color: ColorsManager.primarySwatch,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      children: [
                        verticalSpace(10),
                        Image.asset('assets/image/azkarSabah.png',
                            width: 60.w, height: 60.h),
                        verticalSpace(10),
                        Text(
                          'azkarSabah'.tr(),
                          style: TextStyles.font17WhiteRegular,
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpace(15),
                GestureDetector(
                  onTap: () => context.pushNamed(Routes.azkarMasaaScreen),
                  child: Container(
                    height: 110.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                        color: ColorsManager.primarySwatch,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      children: [
                        verticalSpace(10),
                        Image.asset('assets/image/azkarMasaa.png',
                            width: 60.w, height: 60.h),
                        verticalSpace(10),
                        Text(
                          'azkarMasaa'.tr(),
                          style: TextStyles.font17WhiteRegular,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
