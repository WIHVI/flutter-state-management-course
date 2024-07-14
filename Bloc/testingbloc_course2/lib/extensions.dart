/* import 'package:testingbloc_course2/bloc/bloc_actions.dart';

extension UrlString on UserUrl {
  String get urlString {
    switch (this) {
      case UserUrl.users1:
        return 'https://jsonplaceholder.typicode.com/users';
      case UserUrl.users2:
        return 'https://jsonplaceholder.typicode.com/users';
    }
  }
} */

extension Subscript<T> on Iterable<T> {
  T? operator [](int index) => length > index ? elementAt(index) : null;
}

extension IsEqualToIgnoringOrdering<T> on Iterable<T> {
  bool isEqualToIgnoringOrdering(Iterable<T> other) =>
      length == other.length &&
      {...this}.intersection({...other}).length == length;
}
