// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/core/helper/extensions.dart';
import 'package:quran_app/core/helper/spacing.dart';
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
        padding: EdgeInsets.only(top: 35.h),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/image/background.jpeg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            buildDateTimeCardAndAnimationImage(),
            Positioned(bottom: 30.h, child: buildCategories(context)),
          ],
        ),
      ),
    );
  }

  Widget buildDateTimeCardAndAnimationImage() {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      height: 360.h,
      width: 290.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorsManager.primary.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        color: ColorsManager.transparentColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: 0.h, right: 10.w, left: 10.w, bottom: 10.h),
        child: Column(
          children: [
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '${jHijri.day}-',
                      style: TextStyles.font18BlackRegular,
                    ),
                    Text(
                      jHijri.monthName,
                      style: TextStyles.font18BlackRegular,
                    ),
                    Text(
                      '-${jHijri.year}',
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
            Lottie.asset('assets/image/home_animation.json',
                width: 500.w, height: 300.h),
          ],
        ),
      ),
    );
  }

  Widget buildCategories(BuildContext context) {
    return Container(
      height: 200.h,
      width: 320.w,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 70.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                      color: ColorsManager.primarySwatch,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    children: [
                      verticalSpace(10),
                      Image.asset('assets/image/quran.png',
                          width: 35.w, height: 35.h),
                      verticalSpace(5),
                      Text(
                        'quran'.tr(),
                        style: TextStyles.font13WhiteRegular,
                      )
                    ],
                  ),
                ),
                horizontalSpace(30),
                Container(
                  height: 70.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                      color: ColorsManager.primarySwatch,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    children: [
                      verticalSpace(10),
                      Image.asset('assets/image/mark.png',
                          width: 35.w, height: 35.h),
                      verticalSpace(5),
                      Text(
                        'marks'.tr(),
                        style: TextStyles.font13WhiteRegular,
                      )
                    ],
                  ),
                ),
                horizontalSpace(30),
                Container(
                  height: 70.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                      color: ColorsManager.primarySwatch,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    children: [
                      verticalSpace(10),
                      Image.asset('assets/image/tasbih.png',
                          width: 35.w, height: 35.h),
                      verticalSpace(5),
                      Text(
                        'tasbih'.tr(),
                        style: TextStyles.font13WhiteRegular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(10),
            Divider(
              color: ColorsManager.white,
              thickness: 1,
              height: 3.h,
            ),
            verticalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => context.pushNamed('azkarSabahScreen'),
                  child: Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                        color: ColorsManager.primarySwatch,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      children: [
                        verticalSpace(10),
                        Image.asset('assets/image/azkarSabah.png',
                            width: 35.w, height: 35.h),
                        verticalSpace(5),
                        Text(
                          'azkarSabah'.tr(),
                          style: TextStyles.font13WhiteRegular,
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpace(30),
                GestureDetector(
                  onTap: () => context.pushNamed('azkarMasaaScreen'),
                  child: Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                        color: ColorsManager.primarySwatch,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      children: [
                        verticalSpace(10),
                        Image.asset('assets/image/azkarMasaa.png',
                            width: 35.w, height: 35.h),
                        verticalSpace(5),
                        Text(
                          'azkarMasaa'.tr(),
                          style: TextStyles.font13WhiteRegular,
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpace(30),
                GestureDetector(
                  onTap: () => context.pushNamed('hadithScreen'),
                  child: Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                        color: ColorsManager.primarySwatch,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      children: [
                        verticalSpace(10),
                        Image.asset('assets/image/hadith.png',
                            width: 35.w, height: 35.h),
                        verticalSpace(5),
                        Text(
                          'hadith'.tr(),
                          style: TextStyles.font13WhiteRegular,
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
