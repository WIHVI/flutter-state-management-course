import 'package:flutter/material.dart';
import 'package:statefulapp_course/api_provider.dart';

class DateAndTimeWidget extends StatelessWidget {
  const DateAndTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final api = ApiProvider.of(context).api;
    return Text(
      api.dateAndTime ?? 'Tap on the screen to fetch date and time',
    );
  }
}
