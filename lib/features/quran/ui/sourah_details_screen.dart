// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/helper/convert_en_numbers_to_ar.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/style.dart';
import 'package:quran_app/core/widgets/my_appbar.dart';
import 'package:quran_app/features/quran/data/model/quran_models.dart';
import 'package:quran_app/features/quran/logic/cubit/quran_cubit.dart';

class SurahDetailsScreen extends StatefulWidget {
  SurahDetailsScreen({super.key, required this.surah});
  Surah surah;

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  bool isAppbar = true;
  // int selectedDrawerIndex = 0;
  List<Widget> myDrawers = [];

  @override
  void initState() {
    super.initState();
    context.read<QuranCubit>().getAllQuranCubit();
    // myDrawers = [sourahsDrawer(), categoriesDrawer()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lighterprimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(isAppbar ? 60.h : 0.h),
          child: MyAppBar(
            title: '',
          )),
      // drawer: myDrawers[selectedDrawerIndex],
      body: BlocBuilder<QuranCubit, QuranState>(
        builder: (context, state) {
          if (state is QuranLoding) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is QuranSuccess) {
            return buildBody();
          } else if (state is QuranError) {
            return Center(
              child: Text(state.error),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget buildBody() {
    return InkWell(
      onTap: () {
        context.read<QuranCubit>().getAllQuranCubit();
        setState(() {
          isAppbar = !isAppbar;
        });
      },
      child: PageView.builder(
        // itemCount: 10,
        padEnds: false,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (_, index) {
          return buildSourahList();
        },
      ),
    );
  }

  Widget buildSourahList() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/image/sourah_name.png',
                  height: 60.h,
                  width: 600.w,
                  fit: BoxFit.fill,
                ),
                Text(widget.surah.arabicName,
                    style: TextStyles.font20BlackRegular)
              ],
            ),
            Image.asset(
              'assets/image/basmala.png',
              height:
                  widget.surah.surahNumber == 9 || widget.surah.surahNumber == 1
                      ? 0.h
                      : 40.h,
            ),
            RichText(
              textAlign: TextAlign.justify,
              overflow: TextOverflow.visible,
              text: TextSpan(
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                  children: widget.surah.ayahs
                      .map(
                        (e) => TextSpan(
                          text: '${e.text} ${e.ayahNumber.toArabicNumbers} ',
                          style: TextStyles.font16BlackRegular.copyWith(
                              fontFamily: 'QuranKarim',
                              fontWeight: FontWeight.w300,
                              fontSize: 20.sp,
                              height: 1.5),
                        ),
                      )
                      .toList()),
            ),
          ],
        ),
      ),
    );
  }

  // Widget sourahsDrawer() {
  //   return Drawer(
  //     backgroundColor: ColorsManager.primary.withOpacity(0.9),
  //     shape: const BeveledRectangleBorder(),
  //     width: 500.w,
  //     child: ListView(
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.all(10.r),
  //           child: Row(
  //             children: [
  //               IconButton(
  //                 onPressed: () => context.pop(),
  //                 icon: Image.asset(
  //                   'assets/image/arrow.png',
  //                   width: 30.w,
  //                   color: ColorsManager.white,
  //                 ),
  //               ),
  //               horizontalSpace(80.w),
  //               Text(
  //                 'quran'.tr(),
  //                 style: TextStyles.font20WhiteRegular,
  //               )
  //             ],
  //           ),
  //         ),
  //         buildQuranList(),
  //       ],
  //     ),
  //   );
  // }

  // Widget categoriesDrawer() {
  //   return Drawer(
  //     child: Drawer(
  //         width: 210.w,
  //         child: Padding(
  //           padding: EdgeInsets.only(top: 20.h),
  //           child: ListView(
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.only(right: 15),
  //                 child: Text('${'hello'.tr()},',
  //                     style: TextStyles.font14BlueSemiBold),
  //               ),
  //               Padding(
  //                   padding: EdgeInsets.only(right: 40.w),
  //                   child: Text(
  //                     'nice day'.tr(),
  //                     style: TextStyles.font14GrayMedium,
  //                   )),
  //               const Divider(),
  //               ListTile(
  //                 leading: const Icon(Icons.person_2_outlined),
  //                 title: InkWell(
  //                   onTap: () {
  //                     Navigator.pushNamed(context, Routes.quranScreen);
  //                   },
  //                   child: Text(
  //                     'profile'.tr(),
  //                     style: TextStyles.font16BlackRegular,
  //                   ),
  //                 ),
  //               ),
  //               ListTile(
  //                 leading: Icon(
  //                   Icons.logout_outlined,
  //                   color: ColorsManager.red,
  //                 ),
  //                 title: InkWell(
  //                   onTap: () {
  //                     Navigator.pushNamed(context, Routes.tasbihDetailsScreen);
  //                   },
  //                   child: Text(
  //                     'logout'.tr(),
  //                     style: TextStyles.font16RedRegular,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         )),
  //   );
  // }

  // Widget buildQuranList() {
  //   return SingleChildScrollView(
  //     child: ListView.builder(
  //         shrinkWrap: true,
  //         physics: const NeverScrollableScrollPhysics(),
  //         padding: const EdgeInsets.all(8),
  //         itemCount: widget.surah.length,
  //         itemBuilder: (context, index) =>
  //             buildQuranCard(context: context, surah: widget.surah[index])),
  //   );
  // }

  // Widget buildQuranCard({required BuildContext context, required Surah surah}) {
  //   return GestureDetector(
  //     onTap: () => context.pushNamed('surahDetailsScreen', arguments: surah),
  //     child: Card(
  //       color: ColorsManager.primary.withOpacity(0.35),
  //       elevation: 2,
  //       child: Padding(
  //         padding:
  //             EdgeInsets.only(top: 8.h, right: 8.w, bottom: 8.h, left: 8.w),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Row(
  //               children: [
  //                 SizedBox(
  //                     width: 45.w,
  //                     height: 45.h,
  //                     child: Stack(
  //                       alignment: AlignmentDirectional.center,
  //                       children: [
  //                         Image.asset('assets/image/star.png'),
  //                         Positioned(
  //                           child: Text(surah.surahNumber.toArabicNumbers,
  //                               style: TextStyles.font16BlackRegular),
  //                         ),
  //                       ],
  //                     )),
  //                 horizontalSpace(10),
  //                 Text(
  //                   surah.arabicName,
  //                   style: TextStyles.font16BlackRegular,
  //                 ),
  //               ],
  //             ),
  //             Column(children: [
  //               Text(surah.revelationType,
  //                   style: TextStyles.font13WhiteRegular),
  //               // Text('${surah.verseCount} آيه',
  //               //     style: TextStyles.font13WhiteRegular),
  //             ])
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
