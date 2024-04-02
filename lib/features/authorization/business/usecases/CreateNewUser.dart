import 'package:VetLink/core/Typedefs.dart';
import 'package:VetLink/core/UseCase.dart';
import 'package:VetLink/features/authorization/business/repositories/authentication_repository.dart';
import 'package:VetLink/features/authorization/parameeters/UserDataParameters.dart';

class CreateNewUser extends UseCaseWithParams<void, UserDataParameters>
{
  const CreateNewUser({required AuthenticationRepository repository}) 
    : _Repository = repository;

  @override
  FailureOr<void> call(UserDataParameters params) async => _Repository.CreateUser(params);

  final AuthenticationRepository _Repository;
}