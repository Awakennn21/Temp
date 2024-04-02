import 'package:flutter/material.dart';

class DecorationWidget extends StatelessWidget {
const DecorationWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const Column(
      children: [
        Icon(
          Icons.apple,
          size: 100
        ),
        SizedBox(height: 45),
        Text(
          'Witaj',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Zarejestruj się by korzystać z naszego serwisu',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18
          ),
        )
      ]
    );
  }
}