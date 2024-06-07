import 'package:flutter/foundation.dart';

class PrayerTimeModel {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String sunset;
  final String maghrib;
  final String isha;
  final String imsak;
  final String midnight;
  final String firstThird;
  final String lastThird;
  final String readable;
  final String date;
  final double latitude;
  final double longitude;

  PrayerTimeModel({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.sunset,
    required this.maghrib,
    required this.isha,
    required this.imsak,
    required this.midnight,
    required this.firstThird,
    required this.lastThird,
    required this.readable,
    required this.date,
    required this.latitude,
    required this.longitude,
  });

  factory PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimeModel(
      fajr: json['timings']['Fajr'],
      sunrise: json['timings']['Sunrise'],
      dhuhr: json['timings']['Dhuhr'],
      asr: json['timings']['Asr'],
      sunset: json['timings']['Sunset'],
      maghrib: json['timings']['Maghrib'],
      isha: json['timings']['Isha'],
      imsak: json['timings']['Imsak'],
      midnight: json['timings']['Midnight'],
      firstThird: json['timings']['Firstthird'],
      lastThird: json['timings']['Lastthird'],
      readable: json['date']['readable'],
      date: json['date']['gregorian']['date'],
      latitude: json['meta']['latitude'],
      longitude: json['meta']['longitude'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'timings': {
        'Fajr': fajr,
        'Sunrise': sunrise,
        'Dhuhr': dhuhr,
        'Asr': asr,
        'Sunset': sunset,
        'Maghrib': maghrib,
        'Isha': isha,
        'Imsak': imsak,
        'Midnight': midnight,
        'Firstthird': firstThird,
        'Lastthird': lastThird,
      },
      'date': {
        'readable': readable,
      },
      'meta': {
        'timestamp': date,
        'latitude': latitude,
        'longitude': longitude,
      },
    };
  }
}
