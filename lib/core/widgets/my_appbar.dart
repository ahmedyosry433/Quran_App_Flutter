// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/helper/extensions.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/style.dart';

class MyAppBar extends StatelessWidget {
  MyAppBar({required this.title, super.key});
  String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.primary.withOpacity(0.85),
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Image.asset(
              'assets/image/right-arrow.png',
              width: 30,
              color: ColorsManager.white,
            ),
          ),
          SizedBox(
            width: 100.w,
            child: Text(
              title.tr(),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyles.font20WhiteRegular,
            ),
          ),
          IconButton(
            onPressed: () {
              context.pushReplacementNamed('homeScreen');
            },
            icon: Image.asset(
              'assets/image/black_home.png',
              width: 30,
              color: ColorsManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
