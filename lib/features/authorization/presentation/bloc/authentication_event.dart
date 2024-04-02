part of 'authentication_bloc.dart';

sealed class AuthenticationEvent extends Equatable 
{
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class CreateUserEvent extends AuthenticationEvent 
{
  const CreateUserEvent({required UserDataParameters userParams})
    : _UserDataParameters = userParams;

  final UserDataParameters _UserDataParameters;

  @override
  List<Object> get props => [_UserDataParameters];
}

class AuthenticateUserEvent extends AuthenticationEvent
{
  const AuthenticateUserEvent({required AuthenticationData authenticationParams})
    : _AuthenticationData = authenticationParams;

  final AuthenticationData _AuthenticationData;

  @override
  List<Object> get props => [_AuthenticationData];
}