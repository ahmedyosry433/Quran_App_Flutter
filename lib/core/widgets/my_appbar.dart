// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:quran_app/core/helper/convert_en_numbers_to_ar.dart';
import 'package:quran_app/core/helper/extensions.dart';
import 'package:quran_app/core/helper/spacing.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/style.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({required this.title, super.key});
  String title;
  final jHijri = JHijri.now();

  var arabicMonth = DateFormat('MMMM', 'ar').format(DateTime.now()).toString();
  var arabicDay = DateFormat('d', 'ar').format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: ColorsManager.primary.withOpacity(0.85),
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              title == '' ? Scaffold.of(context).openDrawer() : context.pop();
            },
            icon: Image.asset(
              title == ''
                  ? 'assets/image/quran_icon.png'
                  : 'assets/image/arrow.png',
              width: title == '' ? 35.w : 30.w,
              color: ColorsManager.white,
            ),
          ),
          title != ''
              ? SizedBox(
                  width: 100.w,
                  child: Text(
                    title.tr(),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyles.font20WhiteRegular,
                  ),
                )
              : buildDateTimeCardAndBack(context),
          IconButton(
            onPressed: () {
              context.pushNamed('homeScreen');
            },
            icon: Image.asset(
              title == ''
                  ? 'assets/image/menu.png'
                  : 'assets/image/black_home.png',
              width: 30.w,
              color: ColorsManager.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget dateTimeCard({required String day, required String month}) {
    return Container(
      width: 50.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: ColorsManager.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        children: [
          Text(
            month,
            style: TextStyles.font12BlackRegular,
          ),
          Divider(
            color: ColorsManager.primary,
          ),
          Text(
            day,
            style: TextStyles.font14BlackSemiBold,
          ),
        ],
      ),
    );
  }

  Widget buildDateTimeCardAndBack(BuildContext context) {
    return Row(
      children: [
        dateTimeCard(day: jHijri.day.toArabicNumbers, month: jHijri.monthName),
        horizontalSpace(10),
        dateTimeCard(day: arabicDay, month: arabicMonth),
      ],
    );
  }
}
