
import 'package:VetLink/features/authorization/parameeters/AuthenticationParameters.dart';
import 'package:equatable/equatable.dart';

class UserDataParameters extends Equatable
{
  const UserDataParameters({required authentication, required name, required surname, required createdAt})
    : _AuthenticationData = authentication, _Name = name, _Surname = surname, _CreatedAt = createdAt;

  final String _Name;
  String get Name => _Name;

  final String _Surname;
  String get Surname => _Surname;

  final String _CreatedAt;
  String get CreatedAt => _CreatedAt;

  final AuthenticationData _AuthenticationData;
  AuthenticationData get Authentication =>_AuthenticationData;
  
  @override
  List<Object?> get props => [_AuthenticationData];

}