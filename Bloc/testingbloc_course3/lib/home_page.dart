import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingbloc_course3/api/login_api.dart';
import 'package:testingbloc_course3/api/notes_api.dart';
import 'package:testingbloc_course3/bloc/actions.dart';
import 'package:testingbloc_course3/bloc/app_bloc.dart';
import 'package:testingbloc_course3/bloc/app_state.dart';
import 'package:testingbloc_course3/constants/strings.dart';
import 'package:testingbloc_course3/dialogs/generic_dialog.dart';
import 'package:testingbloc_course3/dialogs/loading_screen.dart';
import 'package:testingbloc_course3/extensions/to_list_view.dart';
import 'package:testingbloc_course3/models/login_handle.dart';
import 'package:testingbloc_course3/views/login_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
        loginApi: LoginApi(),
        notesApi: NotesApi(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(homePage),
        ),
        body: BlocConsumer<AppBloc, AppState>(
          builder: (context, state) {
            final notes = state.fetchedNotes;
            if (notes == null) {
              return LoginView(
                (email, password) {
                  context.read<AppBloc>().add(
                        LoginAcion(
                          email: email,
                          password: password,
                        ),
                      );
                },
              );
            } else {
              return notes.toListView();
            }
          },
          listener: (context, state) {
            // loading screen
            if (state.isLoading) {
              LoadingScreen.instance().show(
                context: context,
                text: pleaseWait,
              );
            } else {
              LoadingScreen.instance().hide();
            }
            // display possible errors
            final loginError = state.loginErrors;
            if (loginError != null) {
              showGenericDialog(
                context: context,
                title: loginErrorDialogTitle,
                content: loginErrorDialogContent,
                optionBuilder: () => {ok: true},
              );
            }
            // if logged in, but have no fetched notes, fetch them now
            if (state.isLoading == false &&
                state.loginErrors == null &&
                state.loginHandle == const LoginHandle.fooBar() &&
                state.fetchedNotes == null) {
              context.read<AppBloc>().add(const LoadNotesAction());
            }
          },
        ),
      ),
    );
  }
}
