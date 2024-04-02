import 'package:VetLink/core/Failure.dart';
import 'package:VetLink/features/authorization/data/models/UserModel.dart';
import 'package:VetLink/features/authorization/parameeters/AuthenticationParameters.dart';
import 'package:VetLink/features/authorization/parameeters/UserDataParameters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseRemoteDataSource
{
  const FireBaseRemoteDataSource();

  Future<void> CreateUser(UserDataParameters userDataParameters) async 
  {
    try
    {
      UserModel newUser = UserModel(
        email: userDataParameters.Authentication.Email, 
        name: userDataParameters.Name, 
        surname: userDataParameters.Surname,  
        createdAt: userDataParameters.CreatedAt
      );
    }
    on FirebaseException catch (error)
    {
      throw APIFailure(
        ErrorCode: error.code, 
        ErrorMessage: error.message ?? "Unknown error occured"
      );
    }
  } 

  Future<UserModel> AuthenticateUser(AuthenticationData authenticationData) async
  {
    try
    {
        return UserModel.empty();
    }
    on FirebaseException catch (error)
    {
      throw APIFailure(
        ErrorCode: error.code, 
        ErrorMessage: error.message ?? "Unknown error occured"
      );
    }

    //Get User data from table;
  }
}