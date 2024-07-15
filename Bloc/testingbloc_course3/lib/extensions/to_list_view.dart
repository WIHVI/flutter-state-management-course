import 'package:flutter/material.dart';
import 'package:testingbloc_course3/views/iterable_list_view.dart';

extension ToListVie<T> on Iterable<T> {
  Widget toListView() => IterableListView(iterable: this);
}
