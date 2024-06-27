import 'package:flutter/material.dart';
import 'package:multiprovider_course/date_and_time.dart';

@immutable
class Minutes {
  final String value;
  Minutes() : value = DateAndTime.now();
}
