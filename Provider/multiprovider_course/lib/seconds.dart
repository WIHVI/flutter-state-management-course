import 'package:flutter/material.dart';
import 'package:multiprovider_course/date_and_time.dart';

@immutable
class Seconds {
  final String value;
  Seconds() : value = DateAndTime.now();
}
