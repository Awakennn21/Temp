import 'package:VetLink/core/Constants.dart';
import 'package:flutter/material.dart';

class LoadingSubmitButtonWidget extends StatelessWidget 
{
  final Color _ButtonColor;

  const LoadingSubmitButtonWidget({ Key? key, required Color buttonColor}) 
    : _ButtonColor = buttonColor, super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: Container(
      padding: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: _ButtonColor,
        borderRadius: BorderRadius.circular(12)
      ),
      child: const Center(
        child: CircularProgressIndicator(
          color: ColorConstants.Color4,
        )
      ),
    ),
  );
  }
}