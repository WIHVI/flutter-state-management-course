import 'package:flutter/foundation.dart' show immutable;

@immutable
class LoginHandle {
  final String token;

  const LoginHandle({required this.token});

  const LoginHandle.fooBar() : token = 'foobar';

  @override
  int get hashCode => token.hashCode;

  @override
  bool operator ==(covariant LoginHandle other) =>
      identical(this, other) || token == other.token;

  @override
  String toString() => 'LoginHandle (token = $token)';
}
