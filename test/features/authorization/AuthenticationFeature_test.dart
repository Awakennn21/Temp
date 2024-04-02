import 'package:VetLink/core/Failure.dart';
import 'package:VetLink/features/authorization/business/repositories/authentication_repository.dart';
import 'package:VetLink/features/authorization/business/usecases/AuthenticateUser.dart';
import 'package:VetLink/features/authorization/business/usecases/CreateNewUser.dart';
import 'package:VetLink/features/authorization/data/dataSources/FireBaseRemoteDataSource.dart';
import 'package:VetLink/features/authorization/data/repositories/AuthenticationRepository_Impl.dart';
import 'package:VetLink/features/authorization/parameeters/AuthenticationParameters.dart';
import 'package:VetLink/features/authorization/parameeters/UserDataParameters.dart';
import 'package:VetLink/features/authorization/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock implements FireBaseRemoteDataSource {}
void main()
{
  late MockRemoteDataSource dataSource;
  late AuthenticationRepository authRepo;
  late CreateNewUser createUserUseCase;
  late AuthenticateUser authenticateUserUseCase;
  late AuthenticationBloc bloc;

  setUp(() {
    dataSource = MockRemoteDataSource();
    authRepo = AuthenticationRepository_impl(dataSource: dataSource);
    createUserUseCase = CreateNewUser(repository: authRepo);
    authenticateUserUseCase = AuthenticateUser(repository: authRepo);
    bloc = AuthenticationBloc(createNewUser: createUserUseCase, authenticateUser: authenticateUserUseCase);
  });

  test("Succesfully creating new user", () async {
    //Arrange
    UserDataParameters userParams = UserDataParameters(
      authentication: const AuthenticationData(email: "email@gmail.com", password: "P@ssw0rd"), 
      name: "name", 
      surname: "surname", 
      createdAt: DateTime(1).toString()
    );
  
    when(() => dataSource.CreateUser(userParams)).thenAnswer((invocation) async {});

    //Act
    bloc.add(CreateUserEvent(userParams: userParams));

    expectLater(
      bloc.stream,
      emitsInOrder([
        const CreatingUser(), 
        const UserCreationSuccesful()
      ])
    );
  });

  test("Failure in creating a new user", () async {
    //Arrange
    UserDataParameters userParams = UserDataParameters(
      authentication: const AuthenticationData(email: "email@gmail.com", password: "P@ssw0rd"), 
      name: "name", 
      surname: "surname",  
      createdAt: DateTime(1).toString()
    );
  
    when(() => dataSource.CreateUser(userParams)).thenThrow(APIFailure(ErrorCode: "404", ErrorMessage: "Could not create a user"));

    //Act
    bloc.add(CreateUserEvent(userParams: userParams));

    expectLater(
      bloc.stream,
      emitsInOrder([
        const CreatingUser(), 
        const UserCreationFailure(ErrorMessage: "Could not create a user")
      ])
    );
  });
}