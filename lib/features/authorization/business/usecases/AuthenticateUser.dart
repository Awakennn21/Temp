import 'package:VetLink/core/Typedefs.dart';
import 'package:VetLink/core/UseCase.dart';
import 'package:VetLink/features/authorization/business/entities/user.dart';
import 'package:VetLink/features/authorization/parameeters/AuthenticationParameters.dart';
import 'package:VetLink/features/authorization/business/repositories/authentication_repository.dart';

class AuthenticateUser extends UseCaseWithParams<User, AuthenticationData> 
{
  const AuthenticateUser({required AuthenticationRepository repository}) 
    : _Repository = repository;

  @override
  FailureOr<User> call(AuthenticationData params) async =>
    _Repository.AuthenticateUser(params);

  final AuthenticationRepository _Repository;
}
