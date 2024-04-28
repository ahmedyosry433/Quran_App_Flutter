import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/quran_app.dart';

import 'core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    // to preview in all screen 
    DevicePreview(
    enabled: false,
    builder: (context) => EasyLocalization(
        supportedLocales: const [Locale('ar', 'AE')],
        path: 'assets/lang',
        fallbackLocale: const Locale('ar', 'AE'),
        child: QuranApp(
          appRouter: AppRouter(),
        )),
  ));
}
