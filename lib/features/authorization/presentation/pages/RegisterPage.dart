import 'package:VetLink/core/Constants.dart';
import 'package:VetLink/features/authorization/parameeters/AuthenticationParameters.dart';
import 'package:VetLink/features/authorization/parameeters/UserDataParameters.dart';
import 'package:VetLink/features/authorization/presentation/bloc/authentication_bloc.dart';
import 'package:VetLink/features/authorization/presentation/widgets/DecorationWidget.dart';
import 'package:VetLink/features/authorization/presentation/widgets/LoadingSubmitButtonWidget.dart';
import 'package:VetLink/features/authorization/presentation/widgets/SubmitButtonWidget.dart';
import 'package:VetLink/features/authorization/presentation/widgets/TextFieldsListWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget 
{
  final VoidCallback _ShowLoginPage;
  const RegisterPage({Key? key, required VoidCallback showLoginPage})
    : _ShowLoginPage = showLoginPage, super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> 
{
  final _EmailController = TextEditingController();
  final _PasswordController = TextEditingController();
  final _RepeatedPasswordController = TextEditingController();
  final _NameController = TextEditingController();
  final _SurnameController = TextEditingController();

  void _RegisterNewUser() 
  {
    if (_PasswordController.text.trim() == _RepeatedPasswordController.text.trim()) 
    {
      final UserDataParameters userDataParameters = UserDataParameters(
        authentication: AuthenticationData(
          email: _EmailController.text.trim(),
          password: _PasswordController.text.trim()
        ),
        name: _NameController.text.trim(),
        surname: _SurnameController.text.trim(),
        createdAt: DateTime.now().toString()
      );

      BlocProvider.of<AuthenticationBloc>(context).add(CreateUserEvent(userParams: userDataParameters));
    }
  }

  @override
  Widget build(BuildContext context) 
  {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listenWhen: (previous, current) => true,
      listener: (context, state) 
      {
        print('${state.runtimeType} state caught in the listener');
      },
      child: Scaffold(
          backgroundColor: ColorConstants.Color4,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Upper dectoration
                    const DecorationWidget(),
                    const SizedBox(height: 45),

                    //Text fields
                    TextFieldsListWidget(textFieldsInfo: [
                      TextFieldInfo(
                          hint: "Imię",
                          obscureText: false,
                          marginBottom: 5,
                          textFieldController: _NameController),
                      TextFieldInfo(
                          hint: "Nazwisko",
                          obscureText: false,
                          marginBottom: 5,
                          textFieldController: _SurnameController),
                      TextFieldInfo(
                          hint: "Email",
                          obscureText: false,
                          marginBottom: 5,
                          textFieldController: _EmailController),
                      TextFieldInfo(
                          hint: "Hasło",
                          obscureText: true,
                          marginBottom: 5,
                          textFieldController: _PasswordController),
                      TextFieldInfo(
                          hint: "Powtórz hasło",
                          obscureText: true,
                          marginBottom: 25,
                          textFieldController: _RepeatedPasswordController),
                    ]),

                    //Sign in
                    BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      buildWhen: (previous, current) => true,
                      builder: (context, state) 
                      {
                        print('${state.runtimeType} state caught in the builder');

                        if(state is CreatingUser)
                        {
                          return const LoadingSubmitButtonWidget(
                            buttonColor: ColorConstants.Color1
                          );
                        }
                        else
                        {
                          return SubmitButtonWidget(
                            onTapAction: _RegisterNewUser,
                            buttonColor: ColorConstants.Color1,
                            text: 'Zarejestruj się'
                          );
                        }
                      },
                    ),

                    //Already an user?
                    //Log in
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Posiadam już konto ',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.normal,
                            )),
                        GestureDetector(
                          onTap: widget._ShowLoginPage,
                          child: const Text(
                            'Zaloguj się',
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.Color1),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

  @override
  void dispose() 
  {
    _EmailController.dispose();
    _PasswordController.dispose();
    _RepeatedPasswordController.dispose();
    _NameController.dispose();
    _SurnameController.dispose();
    super.dispose();
  }
}
