import 'package:flutter/foundation.dart' show immutable;
import 'package:testingbloc_course3/enums/login_errors.dart';
import 'package:testingbloc_course3/extensions/unordered_equality.dart';
import 'package:testingbloc_course3/models/login_handle.dart';
import 'package:testingbloc_course3/models/note.dart';

@immutable
class AppState {
  final bool isLoading;
  final LoginErrors? loginErrors;
  final LoginHandle? loginHandle;
  final Iterable<Note>? fetchedNotes;

  const AppState({
    required this.isLoading,
    required this.loginErrors,
    required this.loginHandle,
    required this.fetchedNotes,
  });

  const AppState.empty()
      : isLoading = false,
        loginErrors = null,
        loginHandle = null,
        fetchedNotes = null;

  @override
  String toString() => {
        'isLoading': isLoading,
        'loginErrors': loginErrors,
        'loginHandle': loginHandle,
        'fetchedNotes': fetchedNotes,
      }.toString();

  @override
  bool operator ==(covariant AppState other) {
    final otherPropertiesAreEqual = isLoading == other.isLoading &&
        loginErrors == other.loginErrors &&
        loginHandle == other.loginHandle;

    if (fetchedNotes == null && other.fetchedNotes == null) {
      return otherPropertiesAreEqual;
    } else {
      return otherPropertiesAreEqual &&
          (fetchedNotes?.isEqualTo(other.fetchedNotes) ?? false);
    }
  }

  @override
  int get hashCode => Object.hash(
        isLoading,
        loginErrors,
        loginHandle,
        fetchedNotes,
      );
}
