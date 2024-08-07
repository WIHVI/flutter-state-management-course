import 'package:flutter/material.dart';

class IterableListView<T> extends StatelessWidget {
  const IterableListView({super.key, required this.iterable});

  final Iterable<T> iterable;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: iterable.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            iterable.elementAt(index).toString(),
          ),
        );
      },
    );
  }
}
