import 'package:VetLink/features/authorization/business/usecases/AuthenticateUser.dart';
import 'package:VetLink/features/authorization/business/usecases/CreateNewUser.dart';
import 'package:VetLink/features/authorization/data/dataSources/FireBaseRemoteDataSource.dart';
import 'package:VetLink/features/authorization/data/repositories/AuthenticationRepository_Impl.dart';
import 'package:VetLink/features/authorization/presentation/bloc/authentication_bloc.dart';
import 'package:VetLink/features/authorization/presentation/pages/LoginPage.dart';
import 'package:VetLink/features/authorization/presentation/pages/RegisterPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      create: (_) => AuthenticationBloc(
        createNewUser: CreateNewUser(
          repository: AuthenticationRepository_impl(
            dataSource: const FireBaseRemoteDataSource()
          )
        ),
        authenticateUser: AuthenticateUser(
          repository: AuthenticationRepository_impl(
            dataSource: const FireBaseRemoteDataSource()
          )
        )
      ),
      child: _ShouldDisplayLogin ? LoginPage(showRegisterPage: SwitchShownPages) : RegisterPage(showLoginPage: SwitchShownPages)
    );
  }

  void SwitchShownPages() {
    setState(() {
      _ShouldDisplayLogin = !_ShouldDisplayLogin;
    });
  }
}
