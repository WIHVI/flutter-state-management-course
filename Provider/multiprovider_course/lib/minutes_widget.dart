import 'package:flutter/material.dart';
import 'package:multiprovider_course/minutes.dart';
import 'package:provider/provider.dart';

class MinutesWidget extends StatelessWidget {
  const MinutesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final minutes = context.watch<Minutes>();
    return Expanded(
      child: Container(
        height: 100,
        color: Colors.blueAccent,
        child: Text(minutes.value),
      ),
    );
  }
}
