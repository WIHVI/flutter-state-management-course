import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:testingprovider_course/bread_crumb.dart';

class BreadCrumbWidget extends StatelessWidget {
  const BreadCrumbWidget({super.key, required this.breadCrumbs});

  final UnmodifiableListView<BreadCrumb> breadCrumbs;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadCrumbs.map(
        (breadCrumb) {
          return Text(
            breadCrumb.title,
            style: TextStyle(
              color: breadCrumb.isActive ? Colors.deepPurple : Colors.black,
            ),
          );
        },
      ).toList(),
    );
  }
}
