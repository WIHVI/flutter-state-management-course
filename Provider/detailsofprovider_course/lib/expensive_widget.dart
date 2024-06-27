import 'package:detailsofprovider_course/expensive_object.dart';
import 'package:detailsofprovider_course/object_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final expensiveObject = context.select<ObjectProvider, ExpensiveObject>(
      (provider) => provider.expensiveObject,
    );

    return Container(
      height: 100,
      color: Colors.blueAccent,
      child: Column(
        children: [
          const Text('Expensive Widget'),
          const Text('Last Updated'),
          Text(expensiveObject.lastUpdated),
        ],
      ),
    );
  }
}
