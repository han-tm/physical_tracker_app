
import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

int stringCount(String str) {
  return str.length;
}

Color textToColor(String text) {
  return Color(int.parse('0xFF$text'));
}

DateTime timeAddMonth(DateTime date) {
  return DateTime(date.year, date.month + 1, date.day);
}

String getExperienceString(
    int value,
    String one,
    String two,
    String five,
    bool onlyStr,
    ) {
  String str = "";
  var n = value.abs() % 100;
  var n1 = n % 10;
  if (n > 10 && n < 20) {
    str = five;
  } else if (n1 > 1 && n1 < 5) {
    str = two;
  } else if (n1 == 1) {
    str = one;
  } else {
    str = five;
  }

  return onlyStr ? str : "$value $str";
}

String capitalize(String s) {
  if (s.isEmpty) return s;
  return s[0].toUpperCase() + s.substring(1);
}

String formatDuration(int totalSeconds) {
  final int hours = totalSeconds ~/ 3600;
  final int minutes = (totalSeconds % 3600) ~/ 60;

  if (hours > 0 && minutes > 0) {
    return '$hours ч. $minutes мин';
  } else if (hours > 0) {
    return '$hours ч.';
  } else {
    return '$minutes мин';
  }
}