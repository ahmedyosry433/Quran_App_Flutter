// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/features/prayer_time/data/model/prayer_time_model.dart';
import 'package:quran_app/features/prayer_time/data/repo/prayer_time_repo.dart';

part 'prayer_time_state.dart';

class PrayerTimeCubit extends Cubit<PrayerTimeState> {
  PrayerTimeRepo prayerRepo;
  PrayerTimeCubit(this.prayerRepo) : super(PrayerTimeInitial());

  Position? currentPosition;
  List<PrayerTimeModel> prayerList = [];
  PrayerTimeModel? prayerToday;
  DateTime dateTime = DateTime.now();

  Future getAllPrayerCubit() async {
    emit(PrayerTimeLoading());
    try {
      var res = await prayerRepo.getPrayerTimeRepo(
          yearAndMonth: "2024/6",
          latitude: "30.8415856",
          longitude: "31.320371");

      for (var prayer in res['data']) {
        prayerList.add(PrayerTimeModel.fromJson(prayer));
      }
      prayerToday = prayerList.firstWhere((item) {
        return item.date == "06-06-2024";
      });
    
      emit(PrayerTimeLoaded());
    } catch (e) {
      emit(PrayerTimeError(e.toString()));
      print("______________ERROR CUBIT____$e");
    }
  }

  getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    } catch (e) {
      print("____ERROR____$e");
    }
  }
}
