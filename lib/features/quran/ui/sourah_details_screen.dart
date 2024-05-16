// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran_app/core/helper/convert_en_numbers_to_ar.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/font_weight_helper.dart';
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
    pageCtr = PageController(initialPage: widget.surah.ayahs[0].page - 1);
  }

  PageController pageCtr = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
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
            return Align(alignment: Alignment.center, child: buildBody());
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
    final quranBloc = BlocProvider.of<QuranCubit>(context);

    return InkWell(
      onTap: () {
        setState(() {
          isAppbar = !isAppbar;
        });
      },
      child: PageView.builder(
        // controller: quranBloc.pageController,
        controller: pageCtr,
        itemCount: 604,
        padEnds: false,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        onPageChanged: quranBloc.pageChanged,
        itemBuilder: (_, index) {
          return Container(
            child: BlocProvider.of<QuranCubit>(context).pages.isEmpty
                ? const CircularProgressIndicator.adaptive()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10.h, bottom: 20.h, left: 10.w, right: 10.h),
                          child: Column(
                            // mainAxisSize: MainAxisSize.max,
                            children: List.generate(
                                quranBloc
                                    .getCurrentPageAyahsSeparatedForBasmalah(
                                        index)
                                    .length, (i) {
                              final ayahs = quranBloc
                                  .getCurrentPageAyahsSeparatedForBasmalah(
                                      index)[i];
                              return Column(children: [
                                surahBannerFirstPlace(index, i),
                                quranBloc.getSurahNumberByAyah(ayahs.first) ==
                                            9 ||
                                        quranBloc.getSurahNumberByAyah(
                                                ayahs.first) ==
                                            1
                                    ? const SizedBox.shrink()
                                    : Padding(
                                        padding: EdgeInsets.only(bottom: 8.0.h),
                                        child: ayahs.first.ayahNumber == 1
                                            ? (quranBloc.getSurahNumberByAyah(
                                                            ayahs.first) ==
                                                        95 ||
                                                    quranBloc
                                                            .getSurahNumberByAyah(
                                                                ayahs.first) ==
                                                        97)
                                                ? besmAllah()
                                                : besmAllah2()
                                            : const SizedBox.shrink(),
                                      ),
                                buildTextBuild(
                                  index,
                                  ayahs,
                                ),
                                // surahBannerLastPlace(index, i),
                              ]);
                            }),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            (index + 1).toArabicNumbers,
                            style: TextStyles.font12BlackRegular
                                .copyWith(fontFamily: 'naskh', fontSize: 15.sp),
                          ),
                        )
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget surahBannerFirstPlace(int pageIndex, int i) {
    final quranBloc = BlocProvider.of<QuranCubit>(context);
    final ayahs =
        quranBloc.getCurrentPageAyahsSeparatedForBasmalah(pageIndex)[i];
    return ayahs.first.ayahNumber == 1
        ? quranBloc.topOfThePageIndex.contains(pageIndex)
            ? const SizedBox.shrink()
            : surahBanner(
                width: 100.w,
                height: 50.h,
                index: quranBloc.getSurahNumberByAyah(ayahs.first) + 1)
        : const SizedBox.shrink();
  }

  Widget surahBannerLastPlace(int pageIndex, int i) {
    final quranBloc = BlocProvider.of<QuranCubit>(context);

    final ayahs =
        quranBloc.getCurrentPageAyahsSeparatedForBasmalah(pageIndex)[i];
    return quranBloc.downThePageIndex.contains(pageIndex)
        ? surahBanner(index: (quranBloc.getSurahNumberByAyah(ayahs.first) - 1))
        : const SizedBox.shrink();
  }

  Widget buildTextBuild(int pageIndex, List<Ayah> ayahs) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: RichText(
        textAlign: TextAlign.justify,
        // overflow: TextOverflow.visible,
        textDirection: TextDirection.rtl,
        text: TextSpan(
          children: List.generate(ayahs.length, (ayahIndex) {
            return TextSpan(
              children: [
                TextSpan(
                  text: ayahs[ayahIndex].text,
                  style: TextStyles.font16BlackRegular.copyWith(
                      fontFamily: 'uthmanic2',
                      fontWeight: FontWeightHelper.medium,
                      fontSize: 20.sp,
                      height: 1.7,
                      letterSpacing: -0.25,
                      color: Colors.black),
                ),
                WidgetSpan(
                    child: Padding(
                  padding: EdgeInsets.only(right: 7.w, left: 7.w),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/ayah.svg',
                        width: 25.w,
                        // height: 30.h,
                      ),
                      Positioned(
                          child: Text(
                        ayahs[ayahIndex].ayahNumber.toArabicNumbers,
                        style: TextStyles.font13BlackSemiBold.copyWith(
                            fontFamily: 'naskh',
                            fontWeight: FontWeightHelper.medium),
                      )),
                    ],
                  ),
                ))
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget besmAllah() {
    return SvgPicture.asset(
      'assets/svg/besmAllah.svg',
      width: 150.w,
    );
  }

  Widget besmAllah2() {
    return SvgPicture.asset(
      'assets/svg/besmAllah2.svg',
      width: 150.w,
    );
  }

  Widget surahBanner({double? height, double? width, required int index}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          'assets/svg/surah_banner1.svg',
          width: width,
          height: height,
        ),
        Positioned(
            child: SvgPicture.asset(
          'assets/svg/surah_name/00${index - 1}.svg',
          color: ColorsManager.black,
        ))
      ],
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
