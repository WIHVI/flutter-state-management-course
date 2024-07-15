import 'package:testingbloc_course3/api/login_api.dart';
import 'package:testingbloc_course3/api/notes_api.dart';
import 'package:testingbloc_course3/bloc/actions.dart';
import 'package:testingbloc_course3/bloc/app_state.dart';
import 'package:bloc/bloc.dart';
import 'package:testingbloc_course3/enums/login_errors.dart';
import 'package:testingbloc_course3/models/login_handle.dart';

class AppBloc extends Bloc<AppAction, AppState> {
  final LoginApiProtocol loginApi;
  final NotesApiProtocol notesApi;

  AppBloc({
    required this.loginApi,
    required this.notesApi,
  }) : super(const AppState.empty()) {
    // Log in the user
    on<LoginAcion>(
      (event, emit) async {
        // start loading
        emit(
          const AppState(
            isLoading: true,
            loginErrors: null,
            loginHandle: null,
            fetchedNotes: null,
          ),
        );
        // log the user in
        final loginHandle = await loginApi.login(
          email: event.email,
          password: event.password,
        );
        emit(
          AppState(
            isLoading: false,
            loginErrors: loginHandle == null ? LoginErrors.invalidHandle : null,
            loginHandle: loginHandle,
            fetchedNotes: null,
          ),
        );
      },
    );
    // Get the notes
    on<LoadNotesAction>(
      (event, emit) async {
        // start loading
        emit(
          AppState(
            isLoading: true,
            loginErrors: null,
            loginHandle: state.loginHandle,
            fetchedNotes: null,
          ),
        );
        // get the login handle
        final loginHandle = state.loginHandle;
        if (loginHandle != const LoginHandle.fooBar()) {
          // invalid login handle, cannot fetch notes
          emit(
            AppState(
              isLoading: false,
              loginErrors: LoginErrors.invalidHandle,
              loginHandle: loginHandle,
              fetchedNotes: null,
            ),
          );
        } else {
          // this is a valid login handle and want to fetch notes
          final notes = await notesApi.getNotes(loginHandle: loginHandle!);
          emit(
            AppState(
              isLoading: false,
              loginErrors: null,
              loginHandle: loginHandle,
              fetchedNotes: notes,
            ),
          );
        }
      },
    );
  }
}
