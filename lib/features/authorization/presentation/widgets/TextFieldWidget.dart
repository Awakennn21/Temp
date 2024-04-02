import 'package:VetLink/core/Constants.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget 
{
  final TextEditingController _InputController;
  final String _HintText;
  final bool _ShouldObscureText;

  const TextFieldWidget({ Key? key, required  inputController, required String hintText, required bool shouldObscureText}) 
    : _InputController = inputController, _HintText = hintText, _ShouldObscureText = shouldObscureText, super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: _InputController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorConstants.Color1),
            borderRadius: BorderRadius.circular(12)
          ),
          hintText: _HintText,
          fillColor: ColorConstants.Color4,
          filled: true
        ),
        obscureText: _ShouldObscureText
      )
    );
  }
}