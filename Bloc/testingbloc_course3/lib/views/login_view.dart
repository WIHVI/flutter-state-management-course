import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:testingbloc_course3/views/email_text_field.dart';
import 'package:testingbloc_course3/views/login_button.dart';
import 'package:testingbloc_course3/views/password_text_field.dart';

class LoginView extends HookWidget {
  const LoginView(this.onLoginTapped, {super.key});

  final OnLoginTapped onLoginTapped;

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Column(
      children: [
        EmailTextField(emailController: emailController),
        PasswordTextField(passwordController: passwordController),
        LoginButton(
          emailController: emailController,
          passwordController: passwordController,
          onLoginTapped: onLoginTapped,
        ),
      ],
    );
  }
}
