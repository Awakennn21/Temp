import 'package:VetLink/features/authorization/presentation/widgets/SubmitButtonWidget.dart';
import 'package:VetLink/features/authorization/presentation/widgets/TextFieldWidget.dart';
import 'package:flutter/material.dart';
import 'package:VetLink/core/Constants.dart';

class LoginPage extends StatefulWidget 
{
  final VoidCallback _ShowRegisterPage;

  const LoginPage({ Key? key, required VoidCallback showRegisterPage}) 
    : _ShowRegisterPage = showRegisterPage, super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> 
{
  final _EmailController = TextEditingController();
  final _PasswordController = TextEditingController();
  bool _ShouldShowError = false;


  Future<void> _AuthenticateUser() async {
    
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      backgroundColor: ColorConstants.Color4,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //Logo and greetings
              children: [
                const Icon(
                  Icons.apple,
                  size: 100
                ),
                const SizedBox(height: 45),
                const Text(
                  'Witaj',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Zaloguj się by kontynuować',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18
                  ),
                ),
                const SizedBox(height: 45),
            
                //Email
                TextFieldWidget(inputController: _EmailController, hintText: "Email", shouldObscureText: false),
                const SizedBox(height: 5),   

                //Password
                TextFieldWidget(inputController: _PasswordController, hintText: "Hasło", shouldObscureText: true),
                const SizedBox(height: 25),

                //Log in
                SubmitButtonWidget(onTapAction: _AuthenticateUser, buttonColor: ColorConstants.Color1, text: 'Zaloguj się',),
                const SizedBox(height: 5),

                //Wrong password
                Visibility(
                  visible: _ShouldShowError,
                  child: Text(
                    'Podano błędne dane logowania',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade500
                    )
                  )
                ),
                

                //Forgot password?
                //Sign in
                const SizedBox(height: 5),   
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Nie posiadam konta ',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                      )
                    ),
                    GestureDetector(
                      onTap: widget._ShowRegisterPage,
                      child: const Text(
                        'Zarejestruj się',
                        style:  TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.Color1
                        ),
                      ),
                    )
                  ],
                )
                //footer
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose()
  {
    _EmailController.dispose();
    _PasswordController.dispose();
    super.dispose();
  }
}