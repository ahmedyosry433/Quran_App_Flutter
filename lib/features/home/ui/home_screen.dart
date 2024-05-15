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

  var arabicMonth = DateFormat('MMMM', 'ar').format(DateTime.now()).toString();
  var arabicDay = DateFormat('d', 'ar').format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.7,
            image: AssetImage("assets/image/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            verticalSpace(40),
            buildDateTimeCardAndBack(context),
            buildCategories(context),
          ],
        ),
      ),
    );
  }

  Widget dateTimeCard({required String day, required String month}) {
    return Container(
      width: 65.w,
      height: 60.h,
      decoration: BoxDecoration(
          color: ColorsManager.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        children: [
          Text(
            month,
            style: TextStyles.font16BlackRegular,
          ),
          Divider(
            color: ColorsManager.primary,
          ),
          Text(
            day,
            style: TextStyles.font19BlackSemiBold,
          ),
        ],
      ),
    );
  }

  Widget buildDateTimeCardAndBack(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 10.h, bottom: 40.h, right: 15.w, left: 15.w),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: Image.asset(
              'assets/image/arrow.png',
              width: 30.w,
              height: 30.h,
              color: ColorsManager.white,
            ),
          ),
          horizontalSpace(50),
          dateTimeCard(
              day: jHijri.day.toArabicNumbers, month: jHijri.monthName),
          horizontalSpace(40),
          dateTimeCard(day: arabicDay, month: arabicMonth),
        ],
      ),
    );
  }

  Widget buildCategories(BuildContext context) {
    return Container(
      width: 320.w,
      height: 450.h,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: ColorsManager.white),
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
                        border:
                            Border.all(width: 0.3, color: ColorsManager.white),
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
                          style: TextStyles.font15WhiteRegular,
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
                      border:
                          Border.all(width: 0.3, color: ColorsManager.white),
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
                        style: TextStyles.font15WhiteRegular,
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
                        border:
                            Border.all(width: 0.3, color: ColorsManager.white),
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
                          style: TextStyles.font15WhiteRegular,
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
                      border:
                          Border.all(width: 0.3, color: ColorsManager.white),
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
                          style: TextStyles.font15WhiteRegular,
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
                        border:
                            Border.all(width: 0.3, color: ColorsManager.white),
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
                          style: TextStyles.font15WhiteRegular,
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
                        border:
                            Border.all(width: 0.3, color: ColorsManager.white),
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
                          style: TextStyles.font15WhiteRegular,
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
