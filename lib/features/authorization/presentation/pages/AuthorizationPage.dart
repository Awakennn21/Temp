import 'package:VetLink/core/services/injection_container.dart';
import 'package:VetLink/features/authorization/presentation/bloc/authentication_bloc.dart';
import 'package:VetLink/features/authorization/presentation/pages/LoginPage.dart';
import 'package:VetLink/features/authorization/presentation/pages/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorizationPage extends StatefulWidget {
  const AuthorizationPage({Key? key}) : super(key: key);

  @override
  AuthorizationPageState createState() => AuthorizationPageState();
}

class AuthorizationPageState extends State<AuthorizationPage> {
  bool _ShouldDisplayLogin;

  AuthorizationPageState() : _ShouldDisplayLogin = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => serviceLocator<AuthenticationBloc>(),
      child: _ShouldDisplayLogin ? LoginPage(showRegisterPage: SwitchShownPages) : RegisterPage(showLoginPage: SwitchShownPages)
    );
  }

  void SwitchShownPages() {
    setState(() {
      _ShouldDisplayLogin = !_ShouldDisplayLogin;
    });
  }
}
