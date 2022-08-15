import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  const TextFieldInput({Key? key,required this.hintText,required this.textEditingController,required this.textInputType,required this.isPass }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      
      borderSide: BorderSide(color: Colors.white, width: 2.0),
      
    );
    return TextField(
      
      controller: textEditingController,
  decoration: InputDecoration(
    border: inputBorder,
    hintText: hintText,
    fillColor: Colors.white,
    hintStyle: TextStyle(color: Colors.black,fontSize: 18),
    focusedBorder:inputBorder ,
    enabledBorder: inputBorder,
    filled: true,
    contentPadding: const EdgeInsets.all(8),
  ),
  obscureText:isPass ,
  keyboardType:textInputType ,
);
  }
}