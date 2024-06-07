import 'package:quran_app/core/networking/api_service.dart';

class PrayerTimeRepo {
  PrayerTimeRepo({required this.apiService});
  ApiService apiService;

  Future getPrayerTimeRepo(
      {required String yearAndMonth,
      required String latitude,
      required String longitude}) async {
    var res = await apiService.getAllPrayerApi(
        yearAndMonth: yearAndMonth, latitude: latitude, longitude: longitude);
    return res;
  }
}
