part of 'authentication_bloc.dart';

sealed class AuthenticationState extends Equatable {
  const AuthenticationState();
  
  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

class CreatingUser extends AuthenticationState
{
  const CreatingUser();

  @override
  List<Object> get props => [];
}

class UserCreationSuccesful extends AuthenticationState
{
  const UserCreationSuccesful();

  @override
  List<Object> get props => [];
}

class UserCreationFailure extends AuthenticationState
{
  const UserCreationFailure({required this.ErrorMessage});

  @override
  List<Object> get props => [ErrorMessage];

  final String ErrorMessage;
}

class AuthenticatingUser extends AuthenticationState
{
  const AuthenticatingUser();
}

class UserAuthenticationSuccesful extends AuthenticationState
{
  const UserAuthenticationSuccesful({required this.UserData});

  @override
  List<Object> get props => [UserData];

  final User UserData;
}

class UserAuthenticationFailure extends AuthenticationState
{
  const UserAuthenticationFailure({required this.ErrorMessage});

  @override
  List<Object> get props => [ErrorMessage];

  final String ErrorMessage;
}

