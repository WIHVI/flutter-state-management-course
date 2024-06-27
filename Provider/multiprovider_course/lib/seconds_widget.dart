import 'package:flutter/material.dart';
import 'package:multiprovider_course/seconds.dart';
import 'package:provider/provider.dart';

class SecondsWidget extends StatelessWidget {
  const SecondsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final seconds = context.watch<Seconds>();

    return Expanded(
      child: Container(
        height: 100,
        color: Colors.amberAccent,
        child: Text(seconds.value),
      ),
    );
  }
}
