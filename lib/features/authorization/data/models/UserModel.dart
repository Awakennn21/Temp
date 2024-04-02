import 'dart:convert';

import 'package:VetLink/features/authorization/business/entities/user.dart';

class UserModel extends User
{
  const UserModel({
      required super.email,  
      required super.name, 
      required super.surname, 
      required super.createdAt
    });

   UserModel.empty()
    : this(
      email: "email", 
      name: "name", 
      surname: "surname", 
      createdAt: DateTime(0)
    );

  factory UserModel.FromJSON(String source) => UserModel.FromMap(jsonDecode(source) as Map<String, dynamic>);
  
  String ToJSON() => jsonEncode(ToMap());

  UserModel.FromMap(Map<String, dynamic> map) 
    : this(
        email: map['email'] as String, 
        name: map['name'] as String, 
        surname: map['surname'] as String,  
        createdAt: map['createdAt'] as DateTime
      ); 
  
  Map<String, dynamic> ToMap() => {
    'email' : Email,
    'name' : Name,
    'surname' : Surname,
    'createdAt' : CreatedAt
  };
}