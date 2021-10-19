import 'package:examtwo/consts/colors.dart';
import 'package:flutter/material.dart';

Text setBoldText(
  String text, {
  Color? color,
  double? size,
}) =>
    Text(
      text,
      style: TextStyle(
        fontSize: size ?? 14,
        color: color ?? colorBlack,
        fontFamily: "Bold",
      ),
    );

Text setSimpleText(String text, {Color? color, double? size}) => Text(
      text,
      style: TextStyle(
        color: color ?? colorBlack,
        fontSize: size ?? 14,
        fontFamily: "GothamBook"
      ),
    );

Text setSimpleBoldText(String text, {Color? color, double? size}) => Text(
      text,
      style: TextStyle(
        color: color ?? colorBlack,
        fontSize: size ?? 14,
        fontFamily: "GothamBook",
        fontWeight: FontWeight.bold,
      ),
    );
