import 'package:flutter/material.dart';

class SubmitButtonWidget extends StatelessWidget 
{
  final VoidCallback _OnTapAction;
  final Color _ButtonColor;
  final String _Text;

  const SubmitButtonWidget({ Key? key, required VoidCallback onTapAction, required Color buttonColor, required String text}) 
    : _OnTapAction = onTapAction, _ButtonColor = buttonColor, _Text = text, super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: GestureDetector(
      onTap: _OnTapAction,
      child: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: _ButtonColor,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
          child: Text(
            _Text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
            )
          ),
        ),
      ),
    ),
  );
  }
}