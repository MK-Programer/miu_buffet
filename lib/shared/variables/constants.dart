import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintStyle: TextStyle(
    fontSize: fontSizeS,
  ),
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFFA83332),
      width: 2.0,
    ),
  ),
);

//const variable responsible for font family
const fontFamily = 'Cairo';
//const variable responsible for font size
const fontSizeHH = 30.0;
const fontSizeH = 20.0;
const fontSizeM = 18.0;
const fontSizeS = 15.0;
