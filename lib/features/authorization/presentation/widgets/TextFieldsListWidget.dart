import 'package:VetLink/features/authorization/presentation/widgets/TextFieldWidget.dart';
import 'package:flutter/material.dart';
class TextFieldInfo {

  const TextFieldInfo({String? hint, bool? obscureText, required double marginBottom, required TextEditingController textFieldController})
    : HintText = hint ?? "",
      ShouldObscureText = obscureText ?? false,
      MarginBottom = marginBottom,
      TextFieldController = textFieldController;

  final String HintText;
  final double MarginBottom;
  final TextEditingController TextFieldController;
  final bool ShouldObscureText;
}

class TextFieldsListWidget extends StatelessWidget 
{

  TextFieldsListWidget({Key? key, required List<TextFieldInfo> textFieldsInfo}) 
    : this.converted(textFieldsInfo: convertInfoToWidgets(textFieldsInfo));

  const TextFieldsListWidget.converted({Key? key, required List<Widget> textFieldsInfo})
    : _TextFields = textFieldsInfo, super(key: key);

  @override
  Widget build(BuildContext context) 
  { 
    return Column(
      children: _TextFields,
    );
  }

  static List<Widget> convertInfoToWidgets(List<TextFieldInfo> textFieldsInfo) 
  {
    List<Widget> outputList = [];

    for(final fieldInfo in textFieldsInfo) 
    {
      outputList.add(TextFieldWidget(
        inputController: fieldInfo.TextFieldController, 
        hintText: fieldInfo.HintText, 
        shouldObscureText: fieldInfo.ShouldObscureText
      ));

      outputList.add(SizedBox(height: fieldInfo.MarginBottom));
    }

    return outputList;
  }

  final List<Widget> _TextFields;
}