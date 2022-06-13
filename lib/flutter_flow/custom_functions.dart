import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double timeRem(
  DateTime galas,
  DateTime fajer,
  DateTime sunset,
  DateTime sunrise,
  DateTime duha,
  DateTime dohor,
  DateTime aser,
  DateTime magreb,
  DateTime isha,
  DateTime midnight,
  DateTime thuluth,
) {
  final now = DateTime.now();

  List list = [
    [
      (galas.minute + galas.hour * 60) - (now.minute + now.hour * 60),
      galas.minute + (galas.hour * 60),
      "Galas"
    ],
    [
      (fajer.minute + fajer.hour * 60) - (now.minute + now.hour * 60),
      fajer.minute + (fajer.hour * 60),
      "fajer"
    ],
    [
      (sunset.minute + sunset.hour * 60) - (now.minute + now.hour * 60),
      sunset.minute + (sunset.hour * 60),
      "sunset"
    ],
    [
      (sunrise.minute + sunrise.hour * 60) - (now.minute + now.hour * 60),
      sunrise.minute + (sunrise.hour * 60),
      "sunrise"
    ],
    [
      (duha.minute + duha.hour * 60) - (now.minute + now.hour * 60),
      duha.minute + (duha.hour * 60),
      "duha"
    ],
    [
      (dohor.minute + dohor.hour * 60) - (now.minute + now.hour * 60),
      dohor.minute + (dohor.hour * 60),
      "dohor"
    ],
    [
      (aser.minute + aser.hour * 60) - (now.minute + now.hour * 60),
      aser.minute + (aser.hour * 60),
      "aser"
    ],
    [
      (magreb.minute + magreb.hour * 60) - (now.minute + now.hour * 60),
      magreb.minute + (magreb.hour * 60),
      "magreb"
    ],
    [
      (isha.minute + isha.hour * 60) - (now.minute + now.hour * 60),
      isha.minute + (isha.hour * 60),
      "isha"
    ],
    [
      (midnight.minute + midnight.hour * 60) - (now.minute + now.hour * 60),
      midnight.minute + (midnight.hour * 60),
      "midnight"
    ],
    [
      (thuluth.minute + thuluth.hour * 60) - (now.minute + now.hour * 60),
      thuluth.minute + (thuluth.hour * 60),
      "thuluth"
    ]
  ];

  List smallestPair = list.where((score) => score[0] > 0).toList()[0];

  for (int i = 0;
      i < list.where((score) => score[0] > 0).toList().length;
      i++) {
    int pair = list.where((score) => score[0] > 0).toList()[i][0];
    if (pair <= smallestPair[0]) {
      if (list[i + 1][0] > smallestPair[1]) {
        continue;
      }
      smallestPair = list.where((score) => score[0] > 0).toList()[i];
    }
  }

  return (now.minute + now.hour * 60) / smallestPair[1];
}

String inRem(
  DateTime galas,
  DateTime fajer,
  DateTime sunset,
  DateTime sunrise,
  DateTime duha,
  DateTime dohor,
  DateTime aser,
  DateTime magreb,
  DateTime isha,
  DateTime midnight,
  DateTime thuluth,
) {
  while (true) {
    final now = DateTime.now();

    List list = [
      [
        (galas.minute + galas.hour * 60) - (now.minute + now.hour * 60),
        galas.minute + (galas.hour * 60),
        "الغلس"
      ],
      [
        (fajer.minute + fajer.hour * 60) - (now.minute + now.hour * 60),
        fajer.minute + (fajer.hour * 60),
        "الفجر"
      ],
      [
        (sunset.minute + sunset.hour * 60) - (now.minute + now.hour * 60),
        sunset.minute + (sunset.hour * 60),
        "طلوع الشمس"
      ],
      [
        (sunrise.minute + sunrise.hour * 60) - (now.minute + now.hour * 60),
        sunrise.minute + (sunrise.hour * 60),
        "شروق الشمس"
      ],
      [
        (duha.minute + duha.hour * 60) - (now.minute + now.hour * 60),
        duha.minute + (duha.hour * 60),
        "نهاية الضحى"
      ],
      [
        (dohor.minute + dohor.hour * 60) - (now.minute + now.hour * 60),
        dohor.minute + (dohor.hour * 60),
        "الظهر"
      ],
      [
        (aser.minute + aser.hour * 60) - (now.minute + now.hour * 60),
        aser.minute + (aser.hour * 60),
        "العصر"
      ],
      [
        (magreb.minute + magreb.hour * 60) - (now.minute + now.hour * 60),
        magreb.minute + (magreb.hour * 60),
        "المغرب"
      ],
      [
        (isha.minute + isha.hour * 60) - (now.minute + now.hour * 60),
        isha.minute + (isha.hour * 60),
        "العشاء"
      ],
      [
        (midnight.minute + midnight.hour * 60) - (now.minute + now.hour * 60),
        midnight.minute + (midnight.hour * 60),
        "منتصف الليل"
      ],
      [
        (thuluth.minute + thuluth.hour * 60) - (now.minute + now.hour * 60),
        thuluth.minute + (thuluth.hour * 60),
        "الثلث الأخير"
      ]
    ];

    List smallestPair = list.where((score) => score[0] > 0).toList()[0];

    for (int i = 0;
        i < list.where((score) => score[0] > 0).toList().length;
        i++) {
      int pair = list.where((score) => score[0] > 0).toList()[i][0];
      if (pair <= smallestPair[0]) {
        if (list[i + 1][0] > smallestPair[1]) {
          continue;
        }
        smallestPair = list.where((score) => score[0] > 0).toList()[i];
      }
    }

    final int hour = smallestPair[0] ~/ 60;
    final int minutes = smallestPair[0] % 60;
    return "حتى " +
        smallestPair[2] +
        " " +
        '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}';
  }
}
