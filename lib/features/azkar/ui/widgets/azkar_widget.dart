import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/theme/colors.dart';
import 'package:quran_app/core/theme/style.dart';
import 'package:quran_app/features/azkar/data/models/azkar_model.dart';

class AzkarWidget extends StatefulWidget {
  final AzkarModel azkar;

  const AzkarWidget({required this.azkar, Key? key}) : super(key: key);

  @override
  State<AzkarWidget> createState() => _AzkarWidgetState();
}

class _AzkarWidgetState extends State<AzkarWidget> {
  int azkarCount = 1;
  Color color = ColorsManager.primary;

  bool vibStatus = false;
  @override
  void initState() {
    azkarCount = widget.azkar.count;
    super.initState();
    // _vib();
    super.initState();
  }
  // Future<void> _vib() async{
  //   var appPreferences = getIt.get<AppPreferences>();
  //   vibStatus = await appPreferences.getVibrateStatus();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.h),
      child: Card(
        color: ColorsManager.white.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              TextButton(
                onPressed: azkarCount > 0
                    ? () {
                        setState(() {
                          azkarCount -= 1;
                          if (azkarCount == 0) {
                            color = ColorsManager.grey;
                            //   if(vibStatus){
                            //     Vibration.vibrate(duration: 100);
                            //   }
                            // }else{
                            //   if(vibStatus){
                            //     Vibration.vibrate(duration: 20);
                            //   }
                          }
                        });
                      }
                    : null,
                style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(
                  ColorsManager.expansion,
                )),
                child: Container(
                  width: 80.w,
                  height: 200.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    "$azkarCount",
                    style: TextStyles.font14WhiteMedium,
                  ),
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Text(widget.azkar.content,
                    style: TextStyles.font16BlackRegular.copyWith(height: 1.8)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
