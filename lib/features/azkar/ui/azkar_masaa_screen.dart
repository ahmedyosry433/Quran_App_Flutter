import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/features/azkar/data/azkar_masaa_data.dart';
import 'package:quran_app/features/azkar/ui/widgets/azkar_widget.dart';

import '../../../core/widgets/my_appbar.dart';

class AzkarMasaaScreen extends StatelessWidget {
  const AzkarMasaaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: MyAppBar(title: 'azkarMasaa')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/background.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(4),
            itemCount: azkarMasaaList.length,
            itemBuilder: (context, index) =>
                AzkarWidget(azkar: azkarMasaaList[index]),
          ),
        ),
      ),
    );
  }
}
