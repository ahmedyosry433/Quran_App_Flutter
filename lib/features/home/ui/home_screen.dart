// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/core/helper/convert_en_numbers_to_ar.dart';
import 'package:quran_app/core/helper/spacing.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/style.dart';
import 'package:quran_app/features/hadith/data/hadith_data.dart';
import 'package:quran_app/features/hadith/logic/cubit/hadith_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final jHijri = JHijri.now();

  DateTime dateTime = DateTime.now();

  var arabicMonth = DateFormat('MMMM', 'ar').format(DateTime.now()).toString();

  var arabicDay = DateFormat('d', 'ar').format(DateTime.now()).toString();

  int randomIndex = 0;
  @override
  void initState() {
    super.initState();
    randomIndex = BlocProvider.of<HadithCubit>(context)
        .getDailyRandomIndex(hadithList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: ColorsManager.primary,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            verticalSpace(20),
            buildDate(),
            buildLastRead(),
            buildCategoryCard(),
            buildDailyDoaa(),
          ],
        ),
      ),
    );
  }

  Widget buildDate() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        decoration: BoxDecoration(
          color: ColorsManager.primary,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.greyLight,
              offset: const Offset(6, 6),
            ),
          ],
        ),
        child: Container(
          margin:
              EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w, right: 10.w),
          height: 180.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            border: Border.all(width: 1.w, color: ColorsManager.grey),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 45.h,
                            width: 45.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ColorsManager.grey,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.r),
                                topRight: Radius.circular(4.r),
                              ),
                            ),
                            child: Text(
                              '${jHijri.day}'.toArabicNumbers,
                              style: TextStyles.font26WhiteSemiBold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8.h, bottom: 8.h, right: 5.w, left: 10.w),
                            child: Text(
                              jHijri.dayName,
                              style: TextStyles.font15WhiteRegular.copyWith(
                                fontFamily: 'kufi',
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 8.h, right: 5.w, left: 10.w),
                            child: Text(
                              '${jHijri.year.toArabicNumbers} هـ',
                              style: TextStyles.font15WhiteRegular.copyWith(
                                fontFamily: 'kufi',
                              ),
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                    flex: 4,
                    child: SvgPicture.asset(
                      'assets/svg/hijri/${jHijri.month}.svg',
                      height: 90.h,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    LinearProgressIndicator(
                      minHeight: 50,
                      value: .70,
                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                      backgroundColor: ColorsManager.white,
                      color: ColorsManager.grey,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: Row(
                        children: [
                          Text(
                            'الصلاه القادمه : ',
                            style: TextStyles.font14BlackSemiBold
                                .copyWith(fontFamily: 'kufi'),
                          ),
                          Text(
                            'العصر',
                            style: TextStyles.font16BlackRegular
                                .copyWith(fontFamily: 'kufi'),
                          ),
                          Text(
                            '4:30'.toArabicNumbers,
                            style: TextStyles.font16BlackRegular
                                .copyWith(fontFamily: 'kufi'),
                          ),
                          horizontalSpace(10),
                          Text(
                            'متبقي : '.toArabicNumbers,
                            style: TextStyles.font14BlackSemiBold
                                .copyWith(fontFamily: 'kufi'),
                          ),
                          Text(
                            '1:30'.toArabicNumbers,
                            style: TextStyles.font16BlackRegular
                                .copyWith(fontFamily: 'kufi'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLastRead() {
    return Container(
      height: 150.h,
      width: 330.w,
      padding: EdgeInsets.only(top: 20.h, right: 0.w, left: 15.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'اخر قراءة',
            style: TextStyles.font16BlackSemiBold.copyWith(
              fontFamily: 'kufi',
            ),
          ),
          verticalSpace(15),
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerRight,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: ColorsManager.grey,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsManager.greyLight,
                      offset: const Offset(-20, 0),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SvgPicture.asset(
                      'assets/svg/surah_name/001.svg',
                      height: 60.h,
                      color: ColorsManager.black,
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 5.w,
                    padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                    decoration: BoxDecoration(
                        color: ColorsManager.white.withOpacity(.5),
                        borderRadius: BorderRadius.all(Radius.circular(8.0.r))),
                  ),
                  horizontalSpace(10),
                  Expanded(
                    flex: 4,
                    child: Text(
                      'رقم الصفحة : 542'.toArabicNumbers,
                      style: TextStyles.font16BlackRegular
                          .copyWith(fontFamily: 'kufi'),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: -15.w,
                child: Container(
                  width: 35.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                      color: ColorsManager.primary,
                      borderRadius: BorderRadius.circular(8.r)),
                  child: Lottie.asset('assets/lottie/arrow.json',
                      width: 15.w, height: 15.h),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCategoryCard() {
    return Column(
      children: [
        Divider(
          color: ColorsManager.primary,
          thickness: 2,
          indent: 10.w,
          endIndent: 10.w,
        ),
        Container(
          margin: EdgeInsets.only(right: 10.w, left: 10.w),
          height: 230.h,
          width: 350.w,
          decoration: BoxDecoration(
            color: ColorsManager.greyLight,
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Container(
                        width: 70.w,
                        height: 60.h,
                        padding: EdgeInsets.only(
                            top: 5.h, bottom: 5.h, right: 10.w, left: 10.w),
                        decoration: BoxDecoration(
                          color: ColorsManager.primary,
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          boxShadow: [
                            BoxShadow(
                              color: ColorsManager.grey.withOpacity(.4),
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/image/salah.png'),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                height: 55.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: ColorsManager.primary,
                                  border: Border.all(color: ColorsManager.grey),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.r),
                                  ),
                                ),
                                child: Text(
                                  'quran'.tr(),
                                  style: TextStyles.font17WhiteRegular
                                      .copyWith(fontFamily: 'kufi'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    horizontalSpace(10),
                    buildCard(
                      3,
                      imageUrl: 'assets/image/salah.png',
                      name: 'hadith',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
                child: Row(
                  children: [
                    buildCard(
                      4,
                      imageUrl: 'assets/image/salah.png',
                      name: 'tasbih',
                    ),
                    horizontalSpace(10),
                    buildCard(
                      4,
                      imageUrl: 'assets/image/salah.png',
                      name: 'hesnMuslim',
                    ),
                    horizontalSpace(10),
                    buildCard(
                      4,
                      imageUrl: 'assets/image/salah.png',
                      name: 'azkarSabah',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
                child: Row(
                  children: [
                    buildCard(
                      3,
                      imageUrl: 'assets/image/salah.png',
                      name: 'azkarMasaa',
                    ),
                    horizontalSpace(10),
                    Expanded(
                      flex: 7,
                      child: Container(
                        width: 70.w,
                        height: 60.h,
                        padding: EdgeInsets.only(
                            top: 5.h, bottom: 5.h, right: 10.w, left: 10.w),
                        decoration: BoxDecoration(
                          color: ColorsManager.primary,
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          boxShadow: [
                            BoxShadow(
                              color: ColorsManager.grey.withOpacity(.4),
                              offset: const Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/image/salah.png'),
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                height: 55.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  color: ColorsManager.primary,
                                  border: Border.all(color: ColorsManager.grey),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.r),
                                  ),
                                ),
                                child: Text(
                                  'salah time'.tr(),
                                  style: TextStyles.font17WhiteRegular
                                      .copyWith(fontFamily: 'kufi'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: ColorsManager.primary,
          thickness: 2,
          indent: 15.w,
          endIndent: 15.w,
        ),
      ],
    );
  }

  Widget buildCard(int flex, {required String imageUrl, required String name}) {
    return Expanded(
      flex: 3,
      child: Container(
        width: 70.w,
        height: 60.h,
        padding:
            EdgeInsets.only(top: 5.h, bottom: 5.h, right: 10.w, left: 10.w),
        decoration: BoxDecoration(
            color: ColorsManager.primary,
            borderRadius: BorderRadius.all(Radius.circular(8.r)),
            boxShadow: [
              BoxShadow(
                color: ColorsManager.grey.withOpacity(.4),
                offset: const Offset(4, 4),
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              height: 35.h,
            ),
            Text(
              name.tr(),
              style:
                  TextStyles.font10WhiteRegular.copyWith(fontFamily: 'kufi'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDailyDoaa() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      // height: 150.h,
      width: 380.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ColorsManager.greyLight.withOpacity(.7),
            offset: const Offset(6, 6),
          ),
        ],
        color: ColorsManager.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 32,
            width: 150,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: ColorsManager.primary,
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            child:
                Text('dailyZeker'.tr(), style: TextStyles.font16WhiteSemiBold),
          ),
          Container(
            width: 370.w,
            padding: EdgeInsets.all(8.w),
            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              border: Border.all(color: ColorsManager.primary.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              hadithList[randomIndex].content,
              style: TextStyles.font16BlackRegular
                  .copyWith(color: ColorsManager.primary),
            ),
          )
        ],
      ),
    );
  }
}
