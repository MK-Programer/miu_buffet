import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintStyle: TextStyle(
    fontSize: fontSizeS,
  ),
  fillColor: white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: white,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: red,
      width: 2.0,
    ),
  ),
);

//edit profile text style
const textStyle1 = TextStyle(
  color: red,
  letterSpacing: letterSpacing2,
  fontSize: fontSizeH,
  fontWeight: fontWeight,
);

const textStyle2 = TextStyle(
  color: red,
  fontSize: fontSizeH,
  fontWeight: fontWeight,
);

const textStyle3 = TextStyle(
  color: black,
  letterSpacing: letterSpacing2,
);

//const variable responsible for font family
const fontFamily = 'Cairo';
//const variable responsible for font size
const fontSizeHH = 30.0;
const fontSizeH = 20.0;
const fontSizeM = 18.0;
const fontSizeS = 15.0;

//const font

//const variable for text alignment with icons in drawer
const alignment = Alignment(-1.2, 0);

//const colors init.
const red = Color(0xFFA83332);
const white = Colors.white;
const transparentWhite = Color(0xFFF6F5F5);
const blackLevel54 = Colors.black54;
const black = Colors.black;
const grey = Colors.grey;
const transparent = Colors.transparent;

//letter spacing init.
const letterSpacing2 = 2.0;

//icon size for bottom bar
const iconSize = 25.0;

//font weight
const fontWeight = FontWeight.bold;
