import 'package:flutter/material.dart';

extension ExpandEqualy on Iterable<Widget> {
  Iterable<Widget> expandEqually() => map((widget) => Expanded(child: widget));
}
