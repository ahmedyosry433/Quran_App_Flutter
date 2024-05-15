import 'package:quran_app/core/networking/service.dart';
import 'package:quran_app/features/quran/data/model/quran_models.dart';

class QuranRepo {
  final Service service;
  QuranRepo({required this.service});
  Future<DataFromJson> getAllSurahsRepo() {
    var res = service.getAllQuran();
    return res;
  }
}
