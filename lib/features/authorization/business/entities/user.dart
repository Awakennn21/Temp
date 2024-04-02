import 'package:equatable/equatable.dart';

abstract class User extends Equatable
{
  const User({required email, required name, required surname, required createdAt})
    : Email = email, Name = name, Surname = surname, CreatedAt = createdAt;
    
  final String Email;
  final String Name;
  final String Surname;
  final String CreatedAt;

  @override
  List<Object?> get props => [Email];
}