import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AppAction {
  const AppAction();
}

@immutable
class LoginAcion implements AppAction {
  final String email;
  final String password;

  const LoginAcion({
    required this.email,
    required this.password,
  });
}

@immutable
class LoadNotesAction implements AppAction {
  const LoadNotesAction();
}
