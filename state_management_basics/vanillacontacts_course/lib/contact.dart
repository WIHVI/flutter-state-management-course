import 'package:uuid/uuid.dart';

class Contact {
  final String id;
  final String name;
  final String number;

  Contact({
    required this.name,
    required this.number,
  }) : id = const Uuid().v4();

  @override
  String toString() => 'name is $name and number is $number';

  @override
  int get hashCode => Object.hash(name, number);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Contact && name == other.name && number == other.number;
  }
}
