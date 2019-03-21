import 'package:flutter/cupertino.dart';
import 'package:resource_manager/resource_manager.dart';

FontWeight _bold = FontWeight.bold;
FontWeight _medium = FontWeight.w500;
FontWeight _light = FontWeight.w300;

TextStyle getH1RegularTextStyle(Color color) => TextStyle(
      fontSize: getDimension("h1_text_size"),
      fontFamily: "sans-serif",
      color: color,
    );
TextStyle getH1MediumTextStyle(Color color) => TextStyle(
      fontSize: getDimension("h1_text_size"),
      fontFamily: "sans-serif",
      fontWeight: _medium,
      color: color,
    );
TextStyle getH1BoldTextStyle(Color color) => TextStyle(
      fontSize: getDimension("h1_text_size"),
      fontFamily: "sans-serif",
      fontWeight: _bold,
      color: color,
    );
TextStyle getH1LightTextStyle(Color color) => TextStyle(
      fontSize: getDimension("h1_text_size"),
      fontFamily: "sans-serif",
      fontWeight: _light,
      color: color,
    );
TextStyle getH2RegularTextStyle(Color color) => TextStyle(
      fontSize: getDimension("h2_text_size"),
      fontFamily: "sans-serif",
      color: color,
    );
TextStyle getH2MediumTextStyle(Color color) => TextStyle(
      fontSize: getDimension("h2_text_size"),
      fontFamily: "sans-serif",
      fontWeight: _medium,
      color: color,
    );
TextStyle getH3RegularTextStyle(Color color) => TextStyle(
      fontSize: getDimension("h3_text_size"),
      fontFamily: "sans-serif",
      color: color,
    );
TextStyle getH3BoldTextStyle(Color color) => TextStyle(
      fontSize: getDimension("h3_text_size"),
      fontFamily: "sans-serif",
      fontWeight: _bold,
      color: color,
    );
TextStyle getH4RegularTextStyle(Color color) => TextStyle(
      fontSize: getDimension("h4_text_size"),
      fontFamily: "sans-serif",
      color: color,
    );
TextStyle getH4MediumTextStyle(Color color) => TextStyle(
      fontSize: getDimension("h4_text_size"),
      fontFamily: "sans-serif",
      fontWeight: _medium,
      color: color,
    );
TextStyle getH5RegularTextStyle(Color color) => TextStyle(
      fontSize: getDimension("h5_text_size"),
      fontFamily: "sans-serif",
      color: color,
    );
TextStyle getH6RegularTextStyle(Color color) => TextStyle(
      fontSize: getDimension("h6_text_size"),
      fontFamily: "sans-serif",
      color: color,
    );
