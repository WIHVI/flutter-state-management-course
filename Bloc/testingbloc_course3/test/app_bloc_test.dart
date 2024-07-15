import 'package:flutter/foundation.dart' show immutable;
import 'package:testingbloc_course3/api/login_api.dart';
import 'package:testingbloc_course3/api/notes_api.dart';
import 'package:testingbloc_course3/bloc/actions.dart';
import 'package:testingbloc_course3/bloc/app_bloc.dart';
import 'package:testingbloc_course3/bloc/app_state.dart';
import 'package:testingbloc_course3/models/login_handle.dart';
import 'package:testingbloc_course3/models/note.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

const Iterable<Note> mockNotes = [
  Note(title: 'Note 1'),
  Note(title: 'Note 2'),
  Note(title: 'Note 3'),
];

@immutable
class DummyNotesApi implements NotesApiProtocol {
  final LoginHandle acceptedLoginHandle;
  final Iterable<Note>? notesToReturnForAcceptedLoginHandle;

  const DummyNotesApi({
    required this.acceptedLoginHandle,
    required this.notesToReturnForAcceptedLoginHandle,
  });

  const DummyNotesApi.empty()
      : acceptedLoginHandle = const LoginHandle.fooBar(),
        notesToReturnForAcceptedLoginHandle = null;

  @override
  Future<Iterable<Note>?> getNotes({required LoginHandle loginHandle}) async {
    if (loginHandle == acceptedLoginHandle) {
      return notesToReturnForAcceptedLoginHandle;
    } else {
      return null;
    }
  }
}

@immutable
class DummyLoginApi implements LoginApiProtocol {
  final String acceptedEmail;
  final String acceptedPassword;
  final LoginHandle handleToReturn;

  const DummyLoginApi({
    required this.acceptedEmail,
    required this.acceptedPassword,
    required this.handleToReturn,
  });

  const DummyLoginApi.empty()
      : acceptedEmail = '',
        acceptedPassword = '',
        handleToReturn = const LoginHandle.fooBar();

  @override
  Future<LoginHandle?> login({
    required String email,
    required String password,
  }) async {
    if (email == acceptedEmail && password == acceptedPassword) {
      return handleToReturn;
    } else {
      return null;
    }
  }
}

void main() {
  blocTest<AppBloc, AppState>(
    'Initial state of the bloc should be AppState.empty()',
    build: () => AppBloc(
      loginApi: const DummyLoginApi.empty(),
      notesApi: const DummyNotesApi.empty(),
    ),
    verify: (bloc) => expect(
      bloc.state,
      const AppState.empty(),
    ),
  );

  blocTest<AppBloc, AppState>(
    'Login with correct credentials',
    build: () => AppBloc(
      loginApi: const DummyLoginApi(
        acceptedEmail: 'foo@baz.com',
        acceptedPassword: 'foo',
        handleToReturn: LoginHandle(token: 'ABC'),
      ),
      notesApi: const DummyNotesApi.empty(),
    ),
    act: (bloc) => bloc.add(
      const LoginAcion(email: 'foo@baz.com', password: 'foo'),
    ),
    expect: () => [
      const AppState(
        isLoading: true,
        loginErrors: null,
        loginHandle: null,
        fetchedNotes: null,
      ),
      const AppState(
        isLoading: false,
        loginErrors: null,
        loginHandle: LoginHandle(token: 'ABC'),
        fetchedNotes: null,
      ),
    ],
  );
}
