import 'package:VetLink/features/authorization/business/entities/user.dart';
import 'package:VetLink/features/authorization/business/usecases/AuthenticateUser.dart';
import 'package:VetLink/features/authorization/business/usecases/CreateNewUser.dart';
import 'package:VetLink/features/authorization/parameeters/AuthenticationParameters.dart';
import 'package:VetLink/features/authorization/parameeters/UserDataParameters.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> 
{
  AuthenticationBloc({required CreateNewUser createNewUser, required AuthenticateUser authenticateUser}) 
    : _CreateNewUser = createNewUser, _AuthenticateUser = authenticateUser, super(AuthenticationInitial()) 
  {
    on<CreateUserEvent>(_OnCreateUserHandler);
    on<AuthenticateUserEvent>(_OnAuthenticateUserHandler);
  }

  _OnCreateUserHandler(CreateUserEvent event, Emitter<AuthenticationState> emit) async
  {
    emit(CreatingUser());

    final creationResult = await _CreateNewUser(event._UserDataParameters);
    creationResult.fold(
      (failure) => emit(UserCreationFailure(ErrorMessage: failure.ErrorMessage)), 
      (_) => emit(UserCreationSuccesful())
    );
  }

  Future<void> _OnAuthenticateUserHandler(AuthenticateUserEvent event, Emitter<AuthenticationState> emit) async
  {
    emit(const AuthenticatingUser());

    final authenticationResult = await _AuthenticateUser(event._AuthenticationData);

    authenticationResult.fold(
      (failure) => emit(UserAuthenticationFailure(ErrorMessage: failure.ErrorMessage)), 
      (user) => emit(UserAuthenticationSuccesful(UserData: user))
    );
  }

  final CreateNewUser _CreateNewUser;
  final AuthenticateUser _AuthenticateUser;
}
