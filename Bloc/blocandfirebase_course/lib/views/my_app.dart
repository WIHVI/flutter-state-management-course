import 'package:blocandfirebase_course/bloc/app_bloc.dart';
import 'package:blocandfirebase_course/bloc/app_event.dart';
import 'package:blocandfirebase_course/bloc/app_state.dart';
import 'package:blocandfirebase_course/dialogs/show_auth_error.dart';
import 'package:blocandfirebase_course/loading/loading_screen.dart';
import 'package:blocandfirebase_course/views/login_view.dart';
import 'package:blocandfirebase_course/views/photo_gallery_view.dart';
import 'package:blocandfirebase_course/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc()..add(const AppEventInitialize()),
      child: MaterialApp(
        title: 'Bloc and Firebase Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocConsumer<AppBloc, AppState>(
          listener: (context, appState) {
            if (appState.isLoading) {
              LoadingScreen.instance().show(
                context: context,
                text: 'Loading...',
              );
            } else {
              LoadingScreen.instance().hide();
            }

            final authError = appState.authError;
            if (authError != null) {
              showAuthError(
                authError: authError,
                context: context,
              );
            }
          },
          builder: (context, appState) {
            if (appState is AppStateLoggedOut) {
              return const LoginView();
            } else if (appState is AppStateLoggedIn) {
              return const PhotoGalleryView();
            } else if (appState is AppStateIsInRegistrationView) {
              return const RegisterView();
            } else {
              // this should never happen.
              // if in cases that shouldn't happen actually happen,
              // you should do an assertion here.
              return Container();
            }
          },
        ),
      ),
    );
  }
}
