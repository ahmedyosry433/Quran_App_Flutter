// ignore_for_file: unused_field

import 'package:dio/dio.dart';
import 'package:quran_app/core/networking/constants.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future getAllPrayerApi(
      {required String yearAndMonth,
      required String latitude,
      required String longitude}) async {
    var headers = {
      'Content-Type': 'application/json',
    };

    Response res = await _dio.request(
        Constants.baseApiUrl +
            yearAndMonth +
            Constants.latitudeUrl +
            latitude +
            Constants.longitudeUrl +
            longitude,
        options: Options(
          method: 'GET',
          headers: headers,
        ));
    return res.data;
  }
}
