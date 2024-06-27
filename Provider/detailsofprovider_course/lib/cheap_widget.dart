import 'package:detailsofprovider_course/cheap_object.dart';
import 'package:detailsofprovider_course/object_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheapWidget extends StatelessWidget {
  const CheapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cheapObject = context.select<ObjectProvider, CheapObject>(
      (provider) => provider.cheapObject,
    );

    return Container(
      height: 100,
      color: Colors.amberAccent,
      child: Column(
        children: [
          const Text('Cheap Widget'),
          const Text('Last Updated'),
          Text(cheapObject.lastUpdated),
        ],
      ),
    );
  }
}
