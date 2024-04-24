import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/helper/extensions.dart';
import 'package:quran_app/core/helper/spacing.dart';

import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/style.dart';
import 'package:quran_app/core/widgets/my_appbar.dart';
import 'package:quran_app/features/tasbih/data/model/tasbih_model.dart';
import 'package:quran_app/features/tasbih/data/tasbih_data.dart';

class TasbihScreen extends StatelessWidget {
  const TasbihScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.h),
            child: MyAppBar(title: 'tasbih')),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/background.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
          child: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: staticTasbihs.length,
              itemBuilder: (context, index) => buildTasbihWidget(
                context,
                staticTasbihs[index],
              ),
            ),
          ),
        ));
  }

  Widget buildTasbihWidget(BuildContext context, TasbihModel tasbih) {
    return Container(
      margin: EdgeInsets.only(top: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 320.w,
            child: ElevatedButton(
              onPressed: () {
                context.pushNamed(
                  'tasbihDetailsScreen',
                  arguments: tasbih,
                );
              },
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
                  backgroundColor: MaterialStateProperty.all(
                      tasbih.type != '(باقيات صالحات)'
                          ? ColorsManager.primarySwatch
                          : ColorsManager.primary),
                  shape: MaterialStateProperty.all(const StadiumBorder())),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 170.w,
                          child: Text(
                            tasbih.name,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.font13WhiteRegular,
                          ),
                        ),
                        horizontalSpace(10),
                        Text(tasbih.type,
                            textAlign: TextAlign.center,
                            style: TextStyles.font13WhiteRegular),
                      ],
                    ),
                  ),
                  Container(
                    width: 35,
                    height: 35,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          color: tasbih.type != '(باقيات صالحات)'
                              ? ColorsManager.grey
                              : ColorsManager.black45),
                    ),
                    child: Center(
                      child: Text('${tasbih.counter}',
                          textAlign: TextAlign.center,
                          style: TextStyles.font13WhiteRegular),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
