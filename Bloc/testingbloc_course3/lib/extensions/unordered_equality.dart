import 'package:collection/collection.dart';

extension UnorderedEquality on Object {
  bool isEqualTo(Object? other) =>
      const DeepCollectionEquality.unordered().equals(this, other);
}
