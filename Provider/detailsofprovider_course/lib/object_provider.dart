import 'dart:async';

import 'package:detailsofprovider_course/cheap_object.dart';
import 'package:detailsofprovider_course/expensive_object.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ObjectProvider extends ChangeNotifier {
  late String id;

  late CheapObject _cheapObject;
  late StreamSubscription _cheapStreamSubscription;
  CheapObject get cheapObject => _cheapObject;

  late ExpensiveObject _expensiveObject;
  late StreamSubscription _expensiveStreamSubscription;
  ExpensiveObject get expensiveObject => _expensiveObject;

  ObjectProvider()
      : id = const Uuid().v4(),
        _cheapObject = CheapObject(),
        _expensiveObject = ExpensiveObject() {
    start();
  }

  @override
  void notifyListeners() {
    id = const Uuid().v4();
    super.notifyListeners();
  }

  void start() {
    _cheapStreamSubscription = Stream.periodic(
      const Duration(seconds: 1),
    ).listen((_) {
      _cheapObject = CheapObject();
      notifyListeners();
    });

    _expensiveStreamSubscription = Stream.periodic(
      const Duration(seconds: 5),
    ).listen((_) {
      _expensiveObject = ExpensiveObject();
      notifyListeners();
    });
  }

  void stop() {
    _cheapStreamSubscription.cancel();
    _expensiveStreamSubscription.cancel();
  }
}
