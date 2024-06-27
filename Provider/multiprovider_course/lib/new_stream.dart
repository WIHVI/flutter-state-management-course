import 'package:multiprovider_course/date_and_time.dart';

class NewStream {
  static Stream<String> newStream(Duration duration) =>
      Stream.periodic(duration, (_) => DateAndTime.now());
}
