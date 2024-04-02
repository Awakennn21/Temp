import 'package:equatable/equatable.dart';

class AuthenticationData extends Equatable
{
  const AuthenticationData({required email, required password})
      : _Email = email,
        _Password = password;

  @override
  List<Object?> get props => [_Email, _Password];
  
  String get Email => _Email; 
  String get Password => _Password; 

  final String _Email;
  final String _Password;
}