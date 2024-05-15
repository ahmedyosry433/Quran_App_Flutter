import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/core/helper/extensions.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/style.dart';

import '../../../core/router/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();

    splashAnimation();
  }

  void splashAnimation() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward()
          ..repeat();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3), () async {
        context.pushNamedAndRemoveUntil(Routes.homeScreen,
            predicate: (context) => false);
      }),
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: ColorsManager.primary.withOpacity(0.85),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250.h,
                  width: 250.w,
                  child: Lottie.asset(
                    'assets/image/splash_animation.json',
                    //   fit: BoxFit.contain,color: Colors.white,
                    animate: true,
                    controller: controller,
                  ),
                ),
                Text(
                  'muslim'.tr(),
                  style: TextStyles.font26WhiteSemiBold,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
