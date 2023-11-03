import 'package:flutter/services.dart';

class CustomLimitacao extends TextInputFormatter{
  final double maxInputValue;

  CustomLimitacao({required this.maxInputValue});
  
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if(maxInputValue != null){
      final double? value = double.tryParse(newValue.text);
      if(value == null){
        return TextEditingValue(
          text: truncated,
          selection: newSelection,
        );
      }
      if(value>maxInputValue){
        truncated = maxInputValue.toString();
      }
    }
    return TextEditingValue(
      text: truncated,
      selection: newSelection
    );
  }


 

}