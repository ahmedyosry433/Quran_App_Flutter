// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quran_app/core/helper/spacing.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/style.dart';
import 'package:quran_app/core/widgets/my_appbar.dart';
import 'package:quran_app/features/tasbih/data/model/tasbih_model.dart';

class TasbihDetailsScreen extends StatefulWidget {
  TasbihDetailsScreen({required this.tasbih, super.key});
  TasbihModel tasbih;

  @override
  State<TasbihDetailsScreen> createState() => _TasbihDetailsScreenState();
}

class _TasbihDetailsScreenState extends State<TasbihDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    super.initState();
  }

  double end = 0;
  int counter = 0;
  int cycle = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: MyAppBar(title: widget.tasbih.name),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsManager.primary,
          image: const DecorationImage(
            image: AssetImage("assets/image/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            buildTasbihCard(),
            tasbihCounter(),
            verticalSpace(20),
            buildButtom(),
          ],
        ),
      ),
    );
  }

  Widget buildTasbihCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            margin: EdgeInsets.only(top: 15.h),
            padding: EdgeInsets.only(top: 10.h),
            width: 350.w,
            height: widget.tasbih.name.length < 6 ||
                    widget.tasbih.name.length < 10 ||
                    widget.tasbih.name.length < 20 ||
                    widget.tasbih.name.length < 40 ||
                    widget.tasbih.name.length < 180
                ? 90.h
                : 150.h,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.primarySwatch.withOpacity(0.25),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: ColorsManager.transparentColor,
                borderRadius: BorderRadius.circular(10.r)),
            child: Text(
              widget.tasbih.name,
              style: TextStyles.font18BlackRegular,
              textAlign: TextAlign.center,
            )),
        verticalSpace(15),
        Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      counter = 0;
                      end = 0;
                      cycle = 0;
                    });
                  },
                  icon: Icon(
                    Icons.restart_alt_outlined,
                    size: 50.sp,
                  )),
              Container(
                width: 120.w,
                height: 90.h,
                decoration: BoxDecoration(
                  color: ColorsManager.primary.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    verticalSpace(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/image/count_of_tasbih.png',
                          height: 35,
                          width: 35,
                        ),
                        Text(
                          '${widget.tasbih.counter}',
                          style: TextStyles.font20WhiteSemiBold,
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: ColorsManager.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/image/tasbihCounter.png',
                          height: 35,
                          width: 35,
                        ),
                        horizontalSpace(0),
                        Text(
                          '$cycle',
                          style: TextStyles.font20WhiteSemiBold,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget tasbihCounter() {
    return Stack(
      children: [
        Container(
          width: 250.w,
          height: 250.w,

          // height: AppSize.s390,
          // width: AppSize.s390,
          alignment: Alignment.center,
          child: Column(
            children: [
              RotationTransition(
                turns: Tween(begin: 0.0, end: end).animate(_controller),
                child: Image.asset(
                  'assets/image/tasbihLogo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: 120.h,
            right: 120.w,
            child: Text(
              '$counter',
              style: TextStyles.font25BlackSemiBold,
            ))
      ],
    );
  }

  Widget buildButtom() {
    return CircularPercentIndicator(
      radius: 50.0,
      lineWidth: 7.0,
      // animation: true,
      //percent: counter < 99 ? double.parse('${counter / 100}') : 1,
      percent: double.parse('${counter / widget.tasbih.counter}'),
      center: SizedBox(
        width: 70.w,
        height: 70.w,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              ColorsManager.primary,
            ),
            shape: MaterialStateProperty.all(const StadiumBorder()),
          ),
          onPressed: () async {
            setState(() {
              end += 0.01;
              counter += 1;
            });
            _controller.forward();
            //
            if (counter == widget.tasbih.counter) {
              setState(() {
                end = 0;
                counter = 0;
                cycle += 1;
              });
              _controller.reset();
            } else {}
          },
          child: Text(
            '$counter',
            //AppStrings.tasbihCounter,
            style: TextStyle(
              color: ColorsManager.white,
            ),
          ),
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: ColorsManager.ihdaaSignatureBoard,
    );
  }
}
