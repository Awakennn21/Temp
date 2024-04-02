import 'package:VetLink/core/Failure.dart';
import 'package:VetLink/core/Typedefs.dart';
import 'package:VetLink/features/authorization/business/entities/user.dart';
import 'package:VetLink/features/authorization/business/repositories/authentication_repository.dart';
import 'package:VetLink/features/authorization/data/dataSources/FireBaseRemoteDataSource.dart';
import 'package:VetLink/features/authorization/parameeters/AuthenticationParameters.dart';
import 'package:VetLink/features/authorization/parameeters/UserDataParameters.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepository_impl implements AuthenticationRepository
{
  AuthenticationRepository_impl({required FireBaseRemoteDataSource this.dataSource});

  @override
  FailureOr<User> AuthenticateUser(AuthenticationData authenticationData) async 
  {
    try
    {
      final User userInfo = await dataSource.AuthenticateUser(authenticationData);
      return Right(userInfo);
    }
    on APIFailure catch(error)
    {
      return Left(error);
    }
  }

  @override
  FailureOrVoid CreateUser(UserDataParameters userDataParameters) async 
  {
    try
    {
      await dataSource.CreateUser(userDataParameters);
      return const Right(null);
    }
    on APIFailure catch(error)
    {
      return Left(error);
    }
  }

  final FireBaseRemoteDataSource dataSource;
  
}