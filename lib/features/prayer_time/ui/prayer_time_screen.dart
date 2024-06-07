import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/helper/convert_en_numbers_to_ar.dart';
import 'package:quran_app/core/helper/spacing.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/style.dart';
import 'package:quran_app/core/widgets/my_appbar.dart';
import 'package:quran_app/features/prayer_time/logic/cubit/prayer_time_cubit.dart';

class PrayerTimeScreen extends StatefulWidget {
  const PrayerTimeScreen({super.key});

  @override
  State<PrayerTimeScreen> createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PrayerTimeCubit>(context).getAllPrayerCubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.h),
            child: MyAppBar(title: 'salah time'.tr())),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: Column(
            children: [
              BlocBuilder<PrayerTimeCubit, PrayerTimeState>(
                  builder: (context, state) {
                if (state is PrayerTimeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PrayerTimeLoaded) {
                  return buildCards(context);
                } else if (state is PrayerTimeError) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return const SizedBox.shrink();
              }),
            ],
          ),
        ));
  }

  Widget buildCards(BuildContext context) {
    return Column(
      children: [
        verticalSpace(30),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.location_on_outlined),
              iconSize: 30.w,
            ),
            Text('Cairo',
                style: TextStyles.font20BlackRegular
                    .copyWith(color: ColorsManager.primary))
          ],
        ),
        verticalSpace(20),
        buildDateTimeCard(),
        verticalSpace(20),
        buildPrayerTime(),
      ],
    );
  }

  Widget buildDateTimeCard() {
    return Container(
      width: 340.w,
      height: 100.h,
      decoration: BoxDecoration(
        color: ColorsManager.greyLight,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.black.withOpacity(0.2),
            offset: const Offset(4, 4), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    final now = DateTime.now();
                    final firstDate = DateTime(now.year - 2);
                    final lastDate = DateTime(now.year + 2);
                    showDatePicker(
                            context: context,
                            initialDate: now,
                            firstDate: firstDate,
                            lastDate: lastDate)
                        .then(
                      (value) {},
                    );
                  },
                  icon: const Icon(Icons.calendar_month_outlined),
                ),
                Text(
                  "الجمعه",
                  style: TextStyles.font18BlackRegular,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                ),
                horizontalSpace(30),
                IconButton(
                  alignment: Alignment.topLeft,
                  onPressed: () {},
                  icon: const Icon(Icons.location_searching_sharp),
                ),
              ],
            ),
            Text(
              '15 ذو الحجه 1445'.toArabicNumbers,
              style: TextStyles.font18BlackRegular,
            ),
            Text(
              '6 يونيو 2024'.toArabicNumbers,
              style: TextStyles.font18BlackRegular,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPrayerTime() {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          width: 340.w,
          height: 70.h,
          decoration: BoxDecoration(
            color: ColorsManager.greyLight.withOpacity(0.4),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              Text(
                "4:30 ".toArabicNumbers,
                style: TextStyles.font18BlackRegular,
              ),
              horizontalSpace(10),
              Text(
                "الفجر ",
                style: TextStyles.font18BlackRegular,
              ),
              horizontalSpace(60),
              Text(
                "1:20:12 ".toArabicNumbers,
                style: TextStyles.font18BlackRegular,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
