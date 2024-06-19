import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:statefulapp_course/api.dart';
import 'package:uuid/uuid.dart';

class ApiProvider extends InheritedWidget {
  final Api api;
  final String uuid;

  ApiProvider({
    Key? key,
    required this.api,
    required Widget child,
  })  : uuid = const Uuid().v4(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant ApiProvider oldWidget) =>
      uuid != oldWidget.uuid;

  static ApiProvider of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ApiProvider>()!;
}
