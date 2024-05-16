// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/core/helper/convert_en_numbers_to_ar.dart';
import 'package:quran_app/core/helper/extensions.dart';
import 'package:quran_app/core/helper/spacing.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/style.dart';
import 'package:quran_app/core/widgets/my_appbar.dart';
import 'package:quran_app/features/quran/data/model/quran_models.dart';
import 'package:quran_app/features/quran/logic/cubit/quran_cubit.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  void initState() {
    context.read<QuranCubit>().getAllQuranCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: MyAppBar(
            title: 'quran',
          ),
        ),
        body: buildQuranList(context));
  }

  Widget buildQuranList(BuildContext context) {
    return BlocBuilder<QuranCubit, QuranState>(
      builder: (context, state) {
        if (state is QuranLoding) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is QuranSuccess) {
          return buildQuranCard(
              context: context, surah: context.read<QuranCubit>().surahs);
        } else if (state is QuranError) {
          return Center(
            child: Text(state.error),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget buildQuranCard(
      {required BuildContext context, required List<Surah> surah}) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: surah.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => context.pushNamed('surahDetailsScreen',
                arguments: surah[index]),
            child: Card(
              color: ColorsManager.primary.withOpacity(0.35),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 8.h, right: 8.w, bottom: 8.h, left: 8.w),
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
                                SvgPicture.asset('assets/svg/sora_num.svg'),
                                Positioned(
                                  child: Text(
                                      surah[index].surahNumber.toArabicNumbers,
                                      style: TextStyles.font18BlackRegular
                                          .copyWith(fontFamily: 'page1')),
                                ),
                              ],
                            )),
                        horizontalSpace(10),
                        SvgPicture.asset(
                          'assets/svg/surah_name/00${index + 1}.svg',
                          width: 75.w,
                          height: 40.h,
                          color: ColorsManager.black,
                        ),
                      ],
                    ),
                    Column(children: [
                      Text(surah[index].revelationType.tr(),
                          style: TextStyles.font13WhiteRegular),
                      Text('${surah[index].ayahs.last.ayahNumber} آيه',
                          style: TextStyles.font13WhiteRegular),
                    ])
                  ],
                ),
              ),
            ),
          );
        });
  }
}
