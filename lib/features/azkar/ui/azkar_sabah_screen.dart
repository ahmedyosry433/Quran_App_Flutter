import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/widgets/my_appbar.dart';
import 'package:quran_app/features/azkar/data/azkar_sabah_data.dart';
import 'package:quran_app/features/azkar/ui/widgets/azkar_widget.dart';

class AzkarSabahScreen extends StatelessWidget {
  const AzkarSabahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: MyAppBar(title: 'azkarSabah')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.5,
            image: AssetImage('assets/image/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(4),
            itemCount: azkarSabahList.length,
            itemBuilder: (context, index) =>
                AzkarWidget(azkar: azkarSabahList[index]),
          ),
        ),
      ),
    );
  }
}
