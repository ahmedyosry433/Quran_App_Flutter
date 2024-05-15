import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:quran_app/features/quran/data/model/quran_models.dart';

class Service {
  Future<DataFromJson> getAllQuran() async {
    var res = await rootBundle.loadString('assets/json/quran.json');
    final data = json.decode(res);

    return DataFromJson.fromJson(data['data']);
  }
}
