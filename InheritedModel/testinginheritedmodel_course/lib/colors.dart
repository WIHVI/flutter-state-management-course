import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

/// Available colors enum
enum AvailableColors { one, two }

/// InheritedModel
class AvailableColorsWidget extends InheritedModel<AvailableColors> {
  final MaterialColor color1;
  final MaterialColor color2;

  const AvailableColorsWidget({
    super.key,
    required super.child,
    required this.color1,
    required this.color2,
  });

  static AvailableColorsWidget of(
    BuildContext context,
    AvailableColors aspect,
  ) {
    return InheritedModel.inheritFrom<AvailableColorsWidget>(
      context,
      aspect: aspect,
    )!;
  }

  @override
  bool updateShouldNotify(covariant AvailableColorsWidget oldWidget) {
    devtools.log('updateShouldNotify');
    return color1 != oldWidget.color1 || color2 != oldWidget.color2;
  }

  @override
  bool updateShouldNotifyDependent(
    covariant AvailableColorsWidget oldWidget,
    Set<AvailableColors> dependencies,
  ) {
    devtools.log('updateShouldNotifyDependent');
    devtools.log('$dependencies');

    if (dependencies.contains(AvailableColors.one) &&
        color1 != oldWidget.color1) {
      return true;
    }

    if (dependencies.contains(AvailableColors.two) &&
        color2 != oldWidget.color2) {
      return true;
    }

    return false;
  }
}

/// Color widget displayed on home page
class ColorWidget extends StatelessWidget {
  const ColorWidget({super.key, required this.color});

  final AvailableColors color;

  @override
  Widget build(BuildContext context) {
    switch (color) {
      case AvailableColors.one:
        devtools.log('Color 1 widget got rebuilt');
        break;
      case AvailableColors.two:
        devtools.log('Color 2 widget got rebuilt');
        break;
    }

    final provider = AvailableColorsWidget.of(context, color);

    return Container(
      height: 100,
      color: color == AvailableColors.one ? provider.color1 : provider.color2,
    );
  }
}

/// Colors list
final colors = [
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.orange,
  Colors.purple,
  Colors.cyan,
  Colors.brown,
  Colors.green,
  Colors.indigo,
];

/// Extension to get a random color
extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(Random().nextInt(length));
}
