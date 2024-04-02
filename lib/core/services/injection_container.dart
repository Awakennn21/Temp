
import 'package:VetLink/features/authorization/business/repositories/authentication_repository.dart';
import 'package:VetLink/features/authorization/business/usecases/AuthenticateUser.dart';
import 'package:VetLink/features/authorization/business/usecases/CreateNewUser.dart';
import 'package:VetLink/features/authorization/data/dataSources/FireBaseRemoteDataSource.dart';
import 'package:VetLink/features/authorization/data/repositories/AuthenticationRepository_Impl.dart';
import 'package:VetLink/features/authorization/presentation/bloc/authentication_bloc.dart';
import 'package:get_it/get_it.dart';

var serviceLocator = GetIt.instance;

Future<void> InitializeDependencies() async
{
  serviceLocator 
    ..registerFactory(() => AuthenticationBloc(createNewUser: serviceLocator(), authenticateUser: serviceLocator()))
    ..registerLazySingleton(() => CreateNewUser(repository: serviceLocator()))
    ..registerLazySingleton(() => AuthenticateUser(repository: serviceLocator()))
    ..registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepository_impl(dataSource: serviceLocator()))
    ..registerLazySingleton(() => const FireBaseRemoteDataSource());
}