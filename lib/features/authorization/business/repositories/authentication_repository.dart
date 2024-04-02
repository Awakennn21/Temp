import 'package:VetLink/core/Typedefs.dart';
import 'package:VetLink/features/authorization/business/entities/user.dart';
import 'package:VetLink/features/authorization/parameeters/AuthenticationParameters.dart';
import 'package:VetLink/features/authorization/parameeters/UserDataParameters.dart';

abstract class AuthenticationRepository
{
  FailureOrVoid CreateUser(UserDataParameters userDataParameters);

  FailureOr<User> AuthenticateUser(AuthenticationData authenticationData);
}