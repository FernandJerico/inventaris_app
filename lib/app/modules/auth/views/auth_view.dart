import 'package:flutter/material.dart';

import 'package:inventaris_app/app/modules/login/views/login_view.dart';
import 'package:inventaris_app/app/modules/register/views/register_view.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  // show login page
  bool showLoginView = true;

  void toggleScreens() {
    setState(() {
      showLoginView = !showLoginView;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginView) {
      return LoginView(showRegisterView: toggleScreens);
    } else {
      return RegisterView(
        showLoginView: toggleScreens,
      );
    }
  }
}
